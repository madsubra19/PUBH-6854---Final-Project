# AMR Profiling Workflow with AMRFinderPlus

## Overview
Microbial organisms are naturally living things that seek survival. 
When microbes are exposed to antibiotics, they are subjected to ongoing selective pressure for survival. 
As a result, they develop mechanisms that counteract these medications, known as antimicrobial resistance (AMR) genes.

As such, any provider needs to be aware of an individual's microbial resistances to ensure appropriate treatment. 
Related questions to address: How can we improve the efficiency of communicating antimicrobial resistance information from a sample of microbial organisms?

## How to Install AMRFinder
For Instructions on how to install AMRFinder, please use this GitHub link: https://github.com/ncbi/amr/wiki/Installing-AMRFinder

**In summary:**
```shell

# ONLY IF YOU DON'T HAVE CONDA INSTALLED:
# Linux
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
# Mac
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash ./Miniconda3-latest-MacOSX-x86_64.sh

# Acticate & initiate conda & AMRFinder dependencies
source ~/miniconda3/bin/activate
conda create -y -c conda-forge -c bioconda -n amrfinder --strict-channel-priority ncbi-amrfinderplus
~/miniconda3/bin/conda init

# To view if AMRfinder has been downloaded correctly
amrfinder -v # prints current AMRFinder version
amrfinder -u # updates the AMRFinder database

```

## How to run the AMR program

**Establish your dependencies for AMRFinder, Snakemake, & R Visualization packages**
```shell
# Create the amrfinder environment
conda create -n amrfinder -f environment.yml

# Ensure the amrfinder environment is up-to-date & activated
conda env update -n amrfinder -f environment.yml
conda activate amrfinder

# List all what in the environment & ensure ggplot2 is listed
conda list

```
**Obtain sequence data (preferably plasmid) and store them in the `/Data` folder as `.fasta` files.**

**Run the `Snakefile` found at the root of the project repository.**

```shell
# Should load in AMRFinder searches followed by attempts to create visuals through R
snakemake --cores 1
```
**The expected outputs of both AMRFinder & visualized AMR panels can be viewed within the `/Results` folder.** 

## Contributions
xyz... 
