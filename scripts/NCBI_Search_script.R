#Libraries
packages <- c("rentrez", "magrittr", "readxl","stringr","dplyr","XML")

for (package in packages) {
  if (!require(package, character.only = TRUE)) {
    install.packages(package)
    library(package, character.only = TRUE)
  } else {
    library(package, character.only = TRUE)
  }
}

#Searching the NCBI 'nucleotide' database, term 'host' not included
# NOTE: Customize the search terms below as needed
Custom_search_NoHost<- entrez_search(db='nucleotide', 
                                      term='Uncultured Chytridiomycota[ORGN] NOT Batrachochytrium[ORGN] 
                                              NOT Neocallimastigomycetes[ORGN] AND 500:20000[SLEN]
                                              AND (rrna OR rDNA OR ITS OR internal transcribed spacer)',
                                      use_history =TRUE) 

number_records <-Custom_search_NoHost$count

#Retreive data to a list
Custom_web_NoHostA<-list()
for (seq_start in seq(from=0, to=number_records, by=500)){  
  Custom_web_NoHost<-entrez_summary(db ='nucleotide', 
                                     web_history = Custom_search_NoHost$web_history, 
                                     retstart=seq_start, 
                                     retmax=500)
  Custom_web_NoHostA[[length(Custom_web_NoHostA)+1]]<-Custom_web_NoHost
}

Custom_web_NoHostA<-unlist(Custom_web_NoHostA, recursive = FALSE)

# NOTE:Choose the needed variables out of 32 available in the list
desired_fields <- lapply(Custom_web_NoHostA, extract_from_esummary, c('uid', 'taxid', "organism", 'caption', 'title', 'extra', 'strain', 'moltype', 'biomol', 'subtype', 'subname', 'strand', 'slen'), simplify=FALSE)

#Extracting information from lists to one table
DB_test1_NoHost <- rbind(sapply(desired_fields, unlist))
#Transform empty fields to NA, and transpose
DB_test1_NoHost[DB_test1_NoHost==""]<-NA
DB_test1_NoHost<-t(DB_test1_NoHost)

# NOTE You can save the output if this is all you need. Change the name of the file 
#write.table(DB_test1_NoHost, 'Output_file.txt', sep='\t') 

#Fetching all information from NCBI  
fetch_NoHost <- entrez_fetch(db="nuccore", web_history=Custom_search_NoHost$web_history,  rettype="xml", retmax=number_records-1, parsed = TRUE)
root <-xmlRoot(fetch_NoHost)

#Transform XML to DataFrame
sequences = xmlToDataFrame(xmlChildren(root)) 

#Choosing the information we want. For all list: names(sequences)
SeqTax = select(sequences, "GBSeq_locus", "GBSeq_taxonomy", "GBSeq_definition", "GBSeq_length", "GBSeq_sequence", "GBSeq_references", "GBSeq_feature-table")

## Retrieving references info
#Convert xml to list 
fetchlist_NoHost <- XML::xmlToList(fetch_NoHost)

#Function to extract information from references. Adapted from  Piotr Kopec from AMU in Poznan.
extract_info <- function(fetchlist, field) {
  sapply(fetchlist, function(x) {
    sapply(x["GBSeq_references"], function(y) {
      if (!is.null(y$GBReference)) {
        value <- switch(
          field,
          authors = y$GBReference$GBReference_authors,
          title   = y$GBReference$GBReference_title,
          journal = y$GBReference$GBReference_journal,
          doi     = y$GBReference$GBReference_xref$GBXref$GBXref_id,
          NA
        )
      } else {
        value <- NA
      }
      value
    })
  })
}

#Extract authors, titles, journals, and DOIs using the function
authors_vec_NoHost <- extract_info(fetchlist_NoHost, "authors")
title_vec_NoHost   <- extract_info(fetchlist_NoHost, "title")
journal_vec_NoHost <- extract_info(fetchlist_NoHost, "journal")
doi_vec_NoHost     <- extract_info(fetchlist_NoHost, "doi")

#Extract sequences and taxonomy
seq_vec_NoHost <- sapply(fetchlist_NoHost, function(x)  x["GBSeq_sequence"])
#taxonomy_vec_NoHost <- sapply(fetchlist_NoHost, function(x)  x["GBSeq_taxonomy"])

#Binding the Search list (DB_test1) with references.
DB_test2_NoHost <- cbind(DB_test1_NoHost, 
                         "Authors" = sapply(authors_vec_NoHost,unlist),
                         "Title"   = sapply(title_vec_NoHost, unlist),
                         "Journal" = sapply(journal_vec_NoHost,unlist), 
                         "DOI"     = sapply(doi_vec_NoHost, unlist),
                         "Seq"     = sapply(seq_vec_NoHost, unlist))


#Transform NULL/empty fields to NA.
DB_test2_NoHost[DB_test2_NoHost=="NULL"]<-NA

#Transform DB_test2_NoHost to data_frame: DF_test2_NoHost
DF_test2_NoHost <- data.frame(col_tmp = rep(0, nrow(DB_test2_NoHost)))

for ( col_name in colnames(DB_test2_NoHost) ) {
  col_vec <- DB_test2_NoHost[, col_name]
  if (col_name == 'Authors') {
    tmp_authors<-lapply(col_vec, function(x) paste(x, collapse =" "))
    my_list<-lapply(tmp_authors, function(x) ifelse(length(x) == 0, NA, x))
    col_df <- data.frame(my_list)
  }else if (is.list(col_vec)) {
    my_list<-lapply(col_vec, function(x) ifelse(length(x) == 0, NA, x))
    col_df <- data.frame(my_list)
  }else {
    col_df <- data.frame(col_vec)
  }
  col_df_t <- t(col_df)
  rownames(col_df_t) <- NULL
  colnames(col_df_t) <- col_name
  col_df_t_df <- as.data.frame(col_df_t)
  DF_test2_NoHost <- cbind(DF_test2_NoHost, col_df_t_df)
}

DF_test2_NoHost <- DF_test2_NoHost[, -1]

##Combining Query of NCBI and Uni of Maine parasite list into one database

#Uploading the parasite list and the table with NCBI search results
ParasiteList<-read.table('ParasiteList_UniMain.txt', sep = '\t', header=TRUE)

#Checking the presence of species in the NCBI list on the Uni of Main parasite list and appending results
DF_test2_NoHost$UMparasite <- DF_test2_NoHost$organism %in% ParasiteList$Species

name_columns <- colnames(DF_test2_NoHost)

#List of unique names in the column subtype
column_uniqs_subtype <- DF_test2_NoHost$subtype %>%
  stringr::str_split('\\|') %>%
  unlist() %>%
  unique()

#Create a list of the columns subtype & Subname (future columns and values)
values <- DF_test2_NoHost$subname%>%
  stringr::str_split('\\|')
features <-DF_test2_NoHost$subtype%>%
  stringr::str_split('\\|')

#Create a partial dataframe (tmp_df)
tmp_df <- data.frame(matrix(NA, nrow = nrow(DF_test2_NoHost), ncol = length(column_uniqs_subtype)))
colnames(tmp_df) <- column_uniqs_subtype

# Fill tmp_df
for (i in 1:nrow(DF_test2_NoHost)) {
  row_values <- rep(NA, length(column_uniqs_subtype))
  
  # Find indices of matching elements in features[[i]] and column_uniqs_subtype
  pos <- match(features[[i]], column_uniqs_subtype)
  
  # Assign values to row_values based on matching positions
  row_values[pos] <- values[[i]]
  
  # Assign row_values to tmp_df
  tmp_df[i, ] <- row_values
}

#Join the partial dataframe with all the data
output_file2<- cbind(DF_test2_NoHost[,1:9], tmp_df, DF_test2_NoHost[, 12:ncol(DF_test2_NoHost)])

#Write the output
# NOTE change the name of the file
write.table(output_file2, file = "File_name.txt", sep = "\t", row.names = FALSE, col.names = TRUE)
