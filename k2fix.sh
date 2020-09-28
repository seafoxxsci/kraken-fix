#!/bin/bash

### 1. Iddo's solution: "Add files in the taxonomy subfolder that aren't in the kraken2 conda"
wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_gb.accession2taxid.gz \
    > $DBNAME/taxonomy/nucl_gb.accession2taxid.gz
wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_wgs.accession2taxid.gz \
    > $DBNAME/taxonomy/nucl_wgs.accession2.taxid.gz
wget https://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz > $DBNAME/taxonomy/taxdump.tar.gz
touch $DBNAME/taxonomy/accmap.dlflag

### 2. Christine's solution: "Clone the github scripts and replace the faulty conda scripts"
git clone https://github.com/DerrickWood/kraken2.git
cp $HOME/kraken2/scripts/* $HOME/.conda/envs/kraken2/libexec
cp $HOME/kraken2/scripts/kraken2{,-build,-inspect> $HOME/.conda/envs/kraken2/bin

# Optional: "Download KrakenTools"
git clone https://github.com/jenniferlu717/KrakenTools.git
chmod +x $HOME/KrakenTools/*.py
