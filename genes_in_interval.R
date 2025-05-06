# Set the working directory where your GFF3 file is located
setwd("/Users/caneryavuz/Downloads/download.20250501.193701/Phytozome/PhytozomeV13/Zmays/RefGen_V4/annotation")

# Install the required packages (GenomicRanges and rtracklayer)
install.packages("BiocManager")  # Install BiocManager package if not already installed
BiocManager::install(c("GenomicRanges", "rtracklayer"))  # Install GenomicRanges and rtracklayer from Bioconductor

# Load necessary libraries
library(GenomicRanges)  # Provides tools for working with genomic intervals
library(rtracklayer)    # Provides tools for importing and exporting genomic data

# Example: Import a GFF3 file (replace with your actual file path)
genes <- import("Zmays_493_RefGen_V4.gene_exons.gff3.gz")  # Import gene annotations from the GFF3 file

# Filter for genes only (we’re interested in "gene" type annotations)
genes <- genes[genes$type == "gene"]  # Only keep "gene" entries from the GFF3 file

# Define a genomic interval of interest (for example, chromosome 2, positions 47e6 to 179e6)
interval <- GRanges(seqnames = "2", ranges = IRanges(47e6, 179e6))  # Genomic range: chromosome 2 from 47,000,000 to 179,000,000

# Find genes that overlap with the defined genomic interval
overlapping_genes <- subsetByOverlaps(genes, interval)  # Identify genes within the given interval

# Count the number of overlapping genes
length(overlapping_genes)  # Output the number of genes that overlap with the defined interval
