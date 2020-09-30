# kraken-fix

A quick fix for the bioconda install of [Kraken 2].

Introduction
============

Kraken 2 is a taxonomic sequence classifier that assigns taxonomic labels to DNA sequences.  Kraken examines the k-mers within a query sequence and uses the information within those k-mers to query a database. That database maps k-mers to the lowest common ancestor (LCA) of all genomes known to contain a given k-mer. If you use Kraken 2 in your own work, please cite either the [Kraken 2 paper] and/or the original [Kraken paper] as appropriate.  Thank you!

[Kraken 2]: https://ccb.jhu.edu/software/kraken2/
[Kraken paper]: https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r46
[Kraken 2 paper]: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-019-1891-0


Installation
============

To begin using Kraken 2, you will first need to install it. Kraken 2 consists of two main scripts (`kraken2` and `kraken2-build`) along with several programs and smaller scripts. Unlike the source installation from [Kraken 2], the conda-build of Kraken 2 installs most programs and smaller scripts into the `libexec` folder and the main scripts into the `bin` folder. 

To install Kraken 2 ver. 2.0.9beta via conda, run each of the below lines of code in your Terminal:

    conda create -n kraken2
    source activate kraken2
    conda install kraken2

If you have miniconda3, the installation can be found at the following $HOME location:
    
    /home/$USER/.conda/envs/kraken2

If you are using Anaconda3, the installation can be found at the following $HOME location:

    /Users/$USER/opt/anaconda3/env/kraken2

One hack to replace faulty scripts is to clone the master branch of Kraken 2 directly from Github and replace identically-named scripts in the conda-build by running the following. Replace `$HOME` in the following commands with the appropriate directory above:

    git clone https://github.com/DerrickWood/kraken2.git
    cp $HOME/kraken2/scripts/* $HOME/.conda/envs/kraken2/libexec
    cp $HOME/kraken2/scripts/kraken2{,-build,-inspect} \ $HOME/.conda/envs/kraken2/bin
