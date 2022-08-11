#!/bin/bash

##############################################################
# User rclone to sync folder to `backups` folder in google drive
#
# New folders are stored in the `scripts/backup_folders` file
# New patterns to exclude get added to `exclude_patterns` array
#
# NOTE: Runs from root dir 
##############################################################

cd ~

# Contains $backup_folders array
source scripts/backup_folders

declare -a exclude_patterns=(
    "__pycache__/"
    "*.log"
    "*.LNK"  # GnuCash file
    "*.LCK"  # GnuCash file
)

# Join all exclude patterns
# Each one needs to get passed by own --exclude flag
exclude_args=${exclude_patterns[@]/#/--exclude }

for folder in "${backup_folders[@]}"; 
do 
    echo "--> Syncing $folder"
    rclone sync $folder gdrive:/backups/$folder $exclude_args --copy-links --progress
done
