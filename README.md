# ParAquaSeq Repository  <img src="https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/images/ParAqua_logo.png" alt="Logo" width="100" />

## Introduction

Zoosporic parasites (i.e. fungi and fungi-like aquatic microorganisms) constitute important drivers of natural populations, causing severe host mortality. Economic impacts of parasitic diseases are notable in microalgae biotech industry, affecting production of food ingredients, biofuels, pharma- and nutraceuticals. While scientific research on this topic is gaining traction by increasing studies elucidating the functional role of zoosporic parasites in natural ecosystems, we are currently lacking integrated and interdisciplinary efforts for effectively detecting and controlling parasites in the microalgae industry. To fill this gap we propose to establish an innovative, dynamic European network connecting scientists, industries and stakeholders to optimize information exchange, equalize access to resources and to develop a joint research agenda. The [COST Action](https://www.cost.eu/actions/CA20125/) [ParAqua](https://paraqua-cost.eu) ("Applications for zoosporic parasites in aquatic systems" [https://paraqua-cost.eu](https://paraqua-cost.eu)) aims at compiling and making available all information on the occurrence of zoosporic parasites and their relationship with hosts, elucidate drivers and evaluate impacts of parasitism in natural and man-made aquatic environments. We aim to implement new tools for monitoring and prevention of infections, and to create protocols and a Decision Support Tool for detecting and controlling parasites in the microalgae biotech production. Applied knowledge on zoosporic parasites can feed back from industry to ecology, and we therefore will explore whether the developed tools can be applied for monitoring lakes and reservoirs. Short-Term Scientific Missions and Training Schools will be organised specifically for early- stage scientists and managers – with a specific focus on ITC – with the aim to share and integrate both scientific and applied expertise and increase exchange between basic and applied researchers and stakeholders.

## Aims of ParAqua:
* Integration and Collaboration: Establish a dynamic European network that connects scientists, industries, and stakeholders. This network aims to optimize information exchange, equalize access to resources, and develop a joint research agenda.
* Information Compilation: Compile and make available comprehensive information on the occurrence of zoosporic parasites and their relationships with hosts.
* Impact Assessment: Elucidate the drivers and evaluate the impacts of parasitism in both natural and man-made aquatic environments.
* Tool Development: Implement new tools for monitoring and preventing infections, and create protocols and a Decision Support Tool for detecting and controlling parasites in the microalgae biotech industry.
* Applied Knowledge: Explore whether the developed tools can be applied for monitoring lakes and reservoirs, feeding back industry knowledge to ecological research.
* Education and Training: Organize Short-Term Scientific Missions and Training Schools for early-stage scientists and managers, with a specific focus on inclusivity and integration of both scientific and applied expertise.

## ParAquaSeq Objective
The WG1 "Occurrence and early detection of zoosporic parasites" aims to provide harmonised and standardised methods, protocols and tools to achieve a robust and comprehensive overview of when, where and on which host we find zoosporic parasites in aquatic environments. 
This overview will not only improve our understanding of the (functional) ecology of zoosporic parasites but also support professionals in the development of early-detection methods and control mechanisms for zoosporic parasite infections in natural and man-made environments.

The ParAquaSeq database is a major deliverable of ParAqua. It provides rRNA sequences belonging to confirmed or putative zoosporic parasites of aquatic primary producers, i.e. microalgae, cyanobacteria, macroalgae and aquatic vascular plants, annotated with their associated information, such as confirmed host species, culture availability, location of isolation, or habitat. ParAquaSeq includes 1,131 sequences belonging to basal fungal groups like Chytridiomycota, or Aphelidiomycota, and other fungi-like organisms like Oomycota, Phytomyxea, as well as endoparasitic Syndiniophyceae or Perkinsea. For details on the contents of the database, and the process of sequences curation, see the associated publication: "ParAquaSeq, a database of ecologically annotated rRNA sequences covering zoosporic  parasites infecting aquatic primary producers in natural and industrial systems". The database is available in different ready-to-use formats, allowing straightforward analyses by end-users. In any case, detailed instructions are provided.

ParAquaSeq can be used to elucidate the role of zoosporic parasites in natural and artificial aquatic systems by shading light on parasites functional roles, and can constitute a tool for monitoring and early detection of infectious diseases. In the long term, the ParAquaSeq database will underpin a better understanding of the extent, ecology and impact of zoosporic parasites on aquatic communities, supporting data analyses from metabarcoding surveys.

## Accessing to ParAquaSeq Datasets
- Metadata files
  - [ParAquaSeq_Parasite_information](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Parasite_information.v1.0.tsv): File containing the basic information of each parasite sequence, including their taxonomy, ribosomal region or collection site details.

     All the variables information is available [here.](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Summary_of_variables_Parasite_information.tsv)
  -  [ParAquaSeq_Primary_hosts](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Primary_hosts.v1.0.tsv): File containing the primary host information of each parasite sequence, including their taxonomy.


     All the variables information is available [here.](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Summary_of_variables_Primary_hosts.tsv)
       
  -  [ParAquaSeq_References](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_References.v1.0.tsv):File containing the bibliographic reference of each parasite sequence.

     All the variables information is available [here.](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Summary_of_variables_References.tsv)

   -  [ParAquaSeq_Additional_known_hosts](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Additional_known_hosts.v1.0.tsv): File containing information about reported additional hosts and bibliographic references.

       All the variables information is available [here.](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_Summary_of_variables_Additonal_known_hosts.tsv)

  
- [Fasta file](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_sequences.v1.0.fasta)  
  <details><summary> Click to see details</summary>
  <p>

    Contains the sequences in FASTA format for easy access and analysis. The ID of each sequence in the FASTA file consists of several fields separated by underscores (`_`):
    - **ID**: The unique sequence identifier
    - **GenBank Code**: The GenBank accession number for the sequence.
    - **Region**: The region of the gene or genome that the sequence represents. (ITS, 18S or 28S)
    - **Taxa**: The taxonomic classification of the organism from which the sequence was obtained. Includes 7 ranks: Kingdom (k), Phylum (p), Class (c), Order (o), Family (f), Genus (g), Species (s).
    </p>
    </details>
- [Fasta file for VSEARCH](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_sequences_vsearch.v1.0.fasta)
  <details><summary> Click to see details</summary>
  <p>
    
    Contains the sequences in FASTA format to perform a taxonomic assignment with VSEARCH. The identificator consist on:
    - **ID**: The unique sequence identifier
    - **Taxa**: "taxa=" follows of the 7 taxonomic ranks: Kingdom (k), Phylum (p), Class (c), Order (o), Family (f), Genus (g), Species (s).
    </p>
    </details>

- [Fasta file for DADA2](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_sequences_DADA2.v1.0.fasta)
  <details><summary> Click to see details</summary>
  <p>
    
    Contains the sequences in FASTA format to perform a taxonomic assignment with DADA2. The identificator consist on:
    - **ID**: The unique sequence identifier
    - **Taxa**: ";" follows of the 7 taxonomic ranks: Kingdom (k); Phylum (p); Class (c); Order (o); Family (f); Genus (g); Species (s).
    </p>
    </details>
- Files for BLASTn ([.nhr](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nhr), [.nin](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nin) and [.nsq](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nsq)) 
    
      
## Using a BLAST Database
In this section, we will guide you through the process of performing BLAST searches.

<details><summary> Click to see details</summary>
<p>
 
  ### Prerequisites
  Before you begin, ensure that you have BLAST (Basic Local Alignment Search Tool) installed on your system/server. You can download and install BLAST from the [NCBI BLAST+ download page.](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
  ### Download the BLAST Database
  Download the provided BLAST database files from the repository. The database consists of several files ([.nhr](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nhr), [.nin](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nin) and [.nsq](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_blast_ddbb.v1.0.nsq)) with a common prefix (blast_ddbb). Ensure all files are downloaded to the same directory.
  ### Run a BLAST Search
  Once you have downloaded the database files, you can run a BLAST search against the database using the blastn command. Here’s an example of how to run a nucleotide BLAST search:
  ```shell  
  blastn -query query_sequence.fasta -db  ParAquaSeq_blast_ddbb.v1.0 -out results.txt -max_target_seqs 4 -outfmt 6
  ```
  - **query** query_sequence.fasta: Specifies the query sequence file in FASTA format. The file containing the sequences you want to search against the dataset.
  - **db** path/blast_db: Specifies the path and prefix of the provided database files.
  - **out** results.txt: Specifies the output file to write the results.
  - **outfmt** 6: Specifies the output format (tabular).
  - **max_target_seqs** 4: Number of aligned sequences to keep.
</p>
</details>

## Using the Provided Dataset with VSEARCH
In this section, we will guide you through the process of performing searches with VSEARCH.

<details><summary> Click to see details</summary>
<p>

  ### Prerequisites
  Before you begin, ensure that you have VSEARCH installed on your system. You can download and install VSEARCH from the [VSEARCH GitHub repository.](https://github.com/torognes/vsearch)
  ### Download the VSEARCH dataset
  Download the provided [VSEARCH fasta file](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_sequences_vsearch.v1.0.fasta) from the repository.
  ### Run a VSEARCH Search
  Once you have downloaded the dataset files, you can run a search against the dataset using VSEARCH. Here’s an example of how to perform a search:
  ```shell
  vsearch --usearch_global query_sequence.fasta --db ParAquaSeq_sequences_vsearch.v1.0.fasta --id 0.9 --blast6out results.txt
  ```
  - **usearch_global**: Specifies the search mode for global alignment.
  - query_seqeunce.fasta: Specifies the query sequence file in FASTA format. The file containing the sequences you want to search against the dataset.
  - **db** path/ParAquaSeq_sequences_vsearch.v1.0.fasta: Specifies the path to the dataset fasta file.
  - **id** 0.9: Specifies the minimum percentage identity for matches (e.g., 90%).
  - **blast6out** results.txt: Specifies the output file in BLAST tabular format (outfmt 6).

  ```shell
  vsearch --sintax query_sequences.fasta --db path/sequences_vsearch.v1.0.fasta --tabbedout results.sintax --sintax_cutoff 0.8
  ```
  - **sintax**: Species the search mode for non-Bayesian taxonomy classifier.
  - query_sequences.fasta: Specifies the query sequence file in FASTA format. The file containing the sequences you want to search against the dataset.
  - **db** path/sequences_vsearch.v1.0.fasta: Specifies the path to the dataset fasta file.
  - **tabbedout** results.sintax: Specifies the output file for the SINTAX results in tab-separated format.
  - **sintax_cutoff** 0.8: Specifies the confidence threshold for taxonomic assignment (e.g., 0.8 for 80% confidence).

</p>
</details>

## Using DADA2
In this section, we will guide you through using the provided dataset in DADA2 pipeline. The entire DADA2 pipeline can be found [here](https://benjjneb.github.io/dada2/tutorial.html).

<details><summary> Click to see details</summary>
<p>

  Download the provided [VSEARCH fasta file](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParAquaSeq_sequences_DADA2.v1.0.fasta) from the repository.

 ```shell
 taxa <- assignTaxonomy(seqtab.nochim, "~/path/sequences_DADA2.v1.0.fasta", multithread=TRUE)
  ```
</p>
</details>

## NCBI Search and Parasite Information Extraction Script

This R script performs a search on the NCBI database to extract sequence information and associated metadata. The output is a .txt file (tab-separated) containing the extracted data.

<details><summary> Click to see details</summary>
<p>

  ### Prerequisites
  
  Before you begin, ensure that you have R installed on your system. You can download and install R from [CRAN](https://cran.r-project.org/).
  Download the [Rscript](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/scripts/NCBI_Search_script.R) and this [file](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/ParasiteList_UniMain.txt). Ensure all files are downloaded to the same directory.

  ### Run the script
  - Open the script and modify if it's nedded the lines after the comment `# NOTE`
  - Run the script in your R environment or RStudio.
  - The query searches used are available [here](https://github.com/ParAqua-COST/ParAquaSeq_Repository/blob/main/files/NCBI_Queries.txt).
</p>
</details>


## Current version
- Version: 1.0
- Released: August 2024
- DOI:
  
## How to cite it

- ParAquaSeq Databases and scripts, DOI: XX.XXX/zenodo.XXXXXXX
- Van den Wyngaert S.,Cerbin S., Garzoli L., Grossart HP., Gsell AS., Kraberg A., Lepère C., Neuhauser S., Stupar M., Tarallo A., Cunliffe M., Gachon C., Gavrilović A., Masigol H., Rasconi S., Selmeczy GB., Schmeller DS., Scholz B., Timoneda N., Trbojević I., Wilk-Woźniak E., Reñé A.  ParAquaSeq, a database of ecologically annotated rRNA sequences covering zoosporic  parasites infecting aquatic primary producers in natural and industrial systems.

## Terms of Use/License information
As of release ParAquaSeq Repository, its scripts, and all files provided for download are licensed under [Create Commons Attribution 4.0 (CC-BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

All data is freely available for academic and commercial use as long as ParAquaSeq Repository is credited as original author and a link to the full license is provided. 

## Report issues
Please report any issue on [GitHub](https://github.com//ParAqua-COST/ParAquaSeq_Repository/issues)

