#!/bin/bash

# Destination directory defaults to the current working directory.
DEST=${1-$(pwd)}
# Source directory defaults to the directory one level up from this script.
SOURCE=${2-$(cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd)}

echo "Source: " $SOURCE
echo "Destination: " $DEST

function maybe_link
{
    SRC=$1
    DST=$2
    if [[ -e $SRC ]];
    then
        if [[ -e $DST || -h $DST ]];
        then
            echo "$DST exists. I will not create a link."
        else
            ln -s $SRC $DST || echo "Could not link $THIS_DEST"
        fi
    fi
}

function maybe_mkdir 
{
    DIR=$1
    if [[ ! -d $DIR ]];
    then
        mkdir $DIR
    fi
}



###########################################################
# Symlink Dotfiles
###########################################################

FILES="slate"

for file in $FILES
do
    THIS_SOURCE=$SOURCE/$file
    THIS_DEST=$DEST/.$file
    maybe_link $THIS_SOURCE $THIS_DEST
done

#########

chflags nohidden ~/Library
