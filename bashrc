# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
export PS1="\u@\h [\w] $ "


# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Set SVN_EDITOR
SVN_EDITOR=vi

HOME_BIN=~/bin
CABAL_BIN=~/.cabal/bin
TEX_BIN=/usr/texbin
NPM_BIN=/usr/local/share/npm/bin

# Add personal entries to PATH
PATH=$PATH:$HOME_BIN:$CABAL_BIN:$TEX_BIN:$NPM_BIN

# Point to proper vimrc
MYVIMRC=~/.vim/.vimrc

# Zach's aliases!
alias vi='vim -p'

. $HOME_BIN/bash-preexec.sh

set_xterm_title () {
    local title="$1"
    case "$TERM" in
        screen)
            echo -ne "\033k$title\033\\"
            ;;
    esac
}

precmd () {
    set_xterm_title "`dirs -0` $PROMPTCHAR"
}

preexec () {
    set_xterm_title "$1 `dirs -0`"
}

preexec_install
