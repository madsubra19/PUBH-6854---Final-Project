# Snakefile for pulling AMR and visualizing data from a bacterial sequence

Data = glob_wildcards("Data/{fasta}.fasta").fasta

rule all:
    input:
        expand("Results/{fasta}_Output.tsv", fasta = Data),
        expand("Results/{fasta}_R_HeatMap.png", fasta = Data),
        expand("Results/{fasta}_R_Bar.png", fasta = Data),
        expand("Results/{fasta}_plots.pdf", fasta = Data)

# Importing sequence data through AMRFinder program
rule get_data: 
    input:
        "Data/{fasta}.fasta"
    output: 
        "Results/{fasta}_Output.tsv"
    shell:
        """
        amrfinder -n {input} -o {output}
       
        """

# Creating visualization of identified AMR and related drug resistances
rule data analysis:
    input:
        AMRFinder_Data = "Results/{fasta}_Output.tsv"
    output: 
        Heat_Map = "Results/{fasta}_R_HeatMap.png",
        Bar = "Results/{fasta}_R_Bar.png",
        pdf = "Results/{fasta}_plots.pdf"
    script:
        "Scripts/RScript_Visualization.R"
