# Snakefile for pulling AMR and visualizing data from a bacterial sequence

rule all:
    input:
        "Results/AMRFinder_Output.tsv",
        "Results/AMR_R_HeatMap.png",
        "Results/AMR_R_Bar.png",
        "Results/AMR_Plots.pdf"

# Importing sequence data through AMRFinder program
rule get_data: 
    input:
        "Data/AMRSeq.fasta"
    output: 
        "Results/AMRFinder_Output.tsv"
    shell:
        """
        amrfinder -n {input} -o {output}
       
        """

# Creating visualization of identified AMR and related drug resistances
rule data analysis:
    input:
        AMRFinder_Data = "Results/AMRFinder_Output.tsv"
    output: 
        Heat_Map = "Results/AMR_R_HeatMap.png",
        Bar = "Results/AMR_R_Bar.png",
        pdf = "Results/AMR_Plots.pdf"
    script:
        "Scripts/RScript_Visualization.R"
