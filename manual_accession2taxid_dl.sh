#!/bin/bash


# Kraken 2 is Copyright 2013-2020, Derrick Wood <dwood@cs.jhu.edu>
# This is a TEMPORARY bug fix for anyone who has installed Kraken2 using the conda build, which pulls the archived 2.0.9-beta version without the update to
# rsync_from_ncbi.pl (ignore/ bypass "na" file paths by FTP or RSYNC when downloading files from NCBI)
# 
# Fix originally suggested by Kraken 2 collaborator Jennifer Lu, jennifer.lu717@gmail.com in this thread: https://github.com/DerrickWood/kraken/issues/132

if [ ! -d "$KRAKEN2_DB_NAME" ]
then
  echo "No Kraken 2 directory exists at $KRAKEN2_DB_NAME, make sure to run 'kraken2-build --download-taxonomy --db $DBNAME'"
  exit -1
  
wget ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_gb.accession2taxid.gz > nucl_gb.accession2taxid.gz
wget ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/nucl_wgs.accession2taxid.gz > nucl_wgs.accession2taxid.gz
touch accmap.dlflag
