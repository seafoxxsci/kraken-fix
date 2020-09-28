#!/bin/bash


# Kraken 2 is Copyright 2013-2020, Derrick Wood <dwood@cs.jhu.edu>
# This is a TEMPORARY bug fix for anyone who has installed Kraken2 using the conda build, which pulls the archived 2.0.9-beta version without the update to
# rsync_from_ncbi.pl (ignore/ bypass "na" file paths by FTP or RSYNC when downloading files from NCBI)
# 
# Fix originally suggested by Kraken 2 collaborator Jennifer Lu, jennifer.lu717@gmail.com in this thread: https://github.com/DerrickWood/kraken/issues/132
# Quickly written
cd "$KRAKEN2_DB_NAME"
wget ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_gb.accession2taxid.gz > nucl_gb.accession2taxid.gz
wget ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_wgs.accession2taxid.gz > nucl_wgs.accession2taxid.gz
touch accmap.dlflag

### 2. Another, potentially problematic solution: "Clone the master branch of Kraken 2 and replace the faulty conda scripts"
git clone https://github.com/DerrickWood/kraken2.git
cp $HOME/kraken2/scripts/* $HOME/.conda/envs/kraken2/libexec
cp $HOME/kraken2/scripts/kraken2{,-build,-inspect> $HOME/.conda/envs/kraken2/bin
