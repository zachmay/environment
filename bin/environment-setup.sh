#!/bin/bash

SOURCE=${1-$(cd ..; pwd)} # Default to absolute path to parent directory.
DEST=${2-$HOME}           # Default to home directory.

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

FILES="vimrc.before
vimrc.after
gvimrc.before
gvimrc.after
vim
janus
oh-my-zsh
bashrc
tmux.conf
zshrc
screenrc
profile"

for file in $FILES
do
    THIS_SOURCE=$SOURCE/$file
    THIS_DEST=$DEST/.$file
    maybe_link $THIS_SOURCE $THIS_DEST
done

# Link .vimrc to Janus vimrc
maybe_link $SOURCE/vim/janus/vim/vimrc $DEST/.vimrc
maybe_link $SOURCE/vim/janus/vim/gvimrc $DEST/.gvimrc

# Create vim backup/temp dirs.
maybe_mkdir $DEST/.vim-backup
maybe_mkdir $DEST/.vim-temp
