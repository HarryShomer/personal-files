#!/bin/bash

##############################################################
# User rclone to sync folder to `backups` folder in google drive
#
# New folders get added to `backup_folders` array
# New patterns to exclude get added to `exclude_patterns` array
#
# NOTE: Runs from root dir 
##############################################################

cd ~

declare -a backup_folders=(
    notes
    grad_courses
    .gnucash
)
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
    rclone sync $folder gdrive:/backups/$folder $exclude_args --progress
done
