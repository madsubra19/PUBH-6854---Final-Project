# Visualization Script for AMR identified by AMRFinderPlus

#Package Used
library(ggplot2)


# Import of Data
AMR_Data <- read.table(snakemake@input[["AMRFinder_Data"]], header = TRUE, sep = "\t")
X <- AMR_Data$Element.symbol
Y <- AMR_Data$Subclass
Z <- AMR_Data$Clas

# Visualization 1: Bar Chart
AMR_Bar <- ggplot(AMR_Data, aes(x = X, fill = Z)) +
  geom_bar(show.legend = TRUE) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
  labs(title = "AMR Panel of Resistances", x = "Antibiotic Genes", y = "Count of AMR", fill = "Class of Drug")
AMR_Bar

# Saving through determined by the Snakefile
ggsave(snakemake@output[["Bar"]], plot = AMR_Bar)

# Visualization 2: Heat Map
AMR_Heat <- ggplot(AMR_Data, aes(X, Y, fill = Z)) + 
  geom_tile() +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 75, hjust = 1)) +
  labs(
    title = "Identified AMR Genes and Corresponding Class Drug Resistance",
    x = "Subclasses of Drugs",
    y = "Identified Antibiotic Resistance Genes",
    fill = "Drug Classes"
  )
AMR_Heat

# Saving through determined by the Snakefile
ggsave(snakemake@output[["Heat_Map"]], plot = AMR_Heat)

# Relocate the Visualization Summary (PDF)
file.rename("Rplots.pdf", "Results/{fasta}_plots.pdf")