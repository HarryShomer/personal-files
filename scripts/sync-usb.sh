#!/bin/bash

#############################################
#
# Sync various folder to usb
#
# $1: direction - either 'to' or 'from'
#     (e.g. 'to' syncs to usb)
#############################################

declare -a folders=(
    notes
    grad_courses
    research
    CVs
    bin
    msu_website
    scripts
    .ssh
)

if [ -z "$1" ]; then
    echo "Usage: sync_usb <direction>"
    exit 1
fi

if [ "$1" != "to" -a "$1" != "from" ]; then
    echo "Invalid location $1! Must be either 'to' or 'from'"
    exit 1
fi

for folder in "${folders[@]}"; 
do 
    echo "--> Syncing $folder"
    
    if [ "$1" == "to" ]; then
        rsync -avh --exclude='.git/' --exclude='__pycache__/' /home/harry/$folder/ /run/media/harry/9C9A-0C9A/arch/$folder/
    else
        rsync -avh --exclude='.git/' --exclude='__pycache__/' /run/media/harry/9C9A-0C9A/arch/$folder/ /home/harry/$folder/
    fi
done



