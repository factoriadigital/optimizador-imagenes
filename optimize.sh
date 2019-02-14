#!/bin/bash

# Show log messages
VERBOSE=true

# Vars
ROOT_DIR="/home/account/public_html"
OWNER="user"

# Function declarations
function usage() 
{
    echo
    echo "Usage: $0"
    echo

    exit 1
}


function show_log()
{
    if [ "$VERBOSE" = true ]; then
        echo $1
    fi    
}

function optimize()
{
    echo -e "\n--------------------------------"
    echo -e "\nStarting optimization process..."
    echo -e "\n--------------------------------"
    convert_cmd
    optipng_cmd
    echo -e "\nFixing permissions..."
    chown -R $OWNER:$OWNER $ROOT_DIR
    echo -e "\nCOMPLETED!"
    echo -e "\n--------------------------------"
}

function convert_cmd()
{
    echo -e "\nConvert CMD in progress..."
    find $ROOT_DIR -type f -iname '*.jpg' -exec convert -quality 60 -strip \{} \{} \;
}

function optipng_cmd()
{
    echo -e "\nOptiPNG CMD in progress..."
    find $ROOT_DIR -type f -iname '*.png' -exec optipng -o7 -strip all {} \;
}

optimize