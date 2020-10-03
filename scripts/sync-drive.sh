#!/bin/bash

##############################################################
# User rclone to sync folder to `backups` folder in google drive
#
# New folders get added to `backup_folders` array
# New patterns to exclude get added to `exclude_args str
#
# NOTE: Runs from root dir 
##############################################################

echo "Moving to root dir"
cd ~

backup_folders=(
    notes
    grad_courses
)

# make sure to separate by space
exclude_args='__pycache__/'

for folder in "${backup_folders[@]}"; 
do 
    rclone sync $folder gdrive:/backups/$folder --exclude $exclude_args --progress
done

