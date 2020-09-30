# kraken-fix

A quick fix for the bioconda install of [Kraken 2]. Kraken 2 is a taxonomic sequence classifier that assigns taxonomic labels to DNA sequences by examining the k-mers within a query sequence to query a database. That database maps k-mers to the lowest common ancestor (LCA) of all genomes known to contain a given k-mer. If you use Kraken 2 in your own work, please cite either the [Kraken 2 paper] and/or the original [Kraken paper] as appropriate.

[Kraken 2]: https://ccb.jhu.edu/software/kraken2/
[Kraken paper]: https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r46
[Kraken 2 paper]: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-019-1891-0

## Installation

To begin using Kraken 2, you will first need to install it. Kraken 2 consists of two main scripts (`kraken2` and `kraken2-build`) along with several programs and smaller scripts. Unlike the source installation from [Kraken 2], the conda-build of Kraken 2 installs most programs and smaller scripts into the `libexec` folder and the main scripts into the `bin` folder. 

To install Kraken 2 ver. 2.0.9beta via conda, run each of the below lines of code in your Terminal:

    conda create -n kraken2
    source activate kraken2
    conda install kraken2

If you have miniconda3, the installation can be found at the following $HOME location:
    
    /home/$USER/.conda/envs/kraken2

If you are using Anaconda3, the installation can be found at the following $HOME location:

    /Users/$USER/opt/anaconda3/env/kraken2

## How to fix the conda install of Kraken 2

One hack to replace faulty scripts is to clone the master branch of Kraken 2 directly from Github and replace identically-named scripts in the conda-build by running the following. Replace `$HOME` in the following commands with the appropriate directory above:

    git clone https://github.com/DerrickWood/kraken2.git
    cp $HOME/kraken2/scripts/* $HOME/.conda/envs/kraken2/libexec
    cp $HOME/kraken2/scripts/kraken2{,-build,-inspect} \ $HOME/.conda/envs/kraken2/bin
    
The other hack is to use `kraken2-build --db $DBNAME --threads $N` to attempt a database build. This repository also contains a `manual_accession2taxid.sh` bash shell script that will circumvent a few known bugs in the `rsync_from_ncbi.pl` and `download_taxonomy.sh` accessory scripts to Kraken 2. To run the script, download from source and run the following in the Terminal:

    chmod u+x manual_accession2taxid.sh
    ./manual_accession2taxid.sh

You should then be able to proceed with all other custom Kraken 2 database build steps outlined in DerrickWood/kraken2/docs/MANUAL.html.
