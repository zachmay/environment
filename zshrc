# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export EDITOR="vim"
bindkey -v

# Options.
setopt AUTO_CD

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

# Customize to your needs...
CABAL_BIN=/Users/zmay/.cabal/bin
NPM_BIN=/usr/local/share/npm/bin
GIT_BIN=/usr/local/git/bin
HOME_BIN=/Users/zmay/bin
TEX_BIN=/usr/texbin

export PATH=/usr/local/share/python/:/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GIT_BIN:$HOME_BIN:$CABAL_BIN:$NPM_BIN:$TEX_BIN

ZSH_THEME=zachnoster

source $ZSH/oh-my-zsh.sh

############################
# Start of Prompt Nonsense #
############################
# 
# function virtualenv_info {
#     [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
# }
# 
# function box_name {
#     [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
# }
# 
# PROMPT='%{$bg[blue]%}%{$fg[white]%}%n@$(hostname)%{$reset_color%}%{$fg[blue]%}%{$bg[gray]%}⮀%{$reset_color%}%{$bg[gray]%} %~ ⮀'
# 
# 
# ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# 
# local return_status="%{$fg[red]%}%(?..⤬)%{$reset_color%}"
# RPROMPT='${return_status}%{$reset_color%}'
# 
##########################
# End of Prompt Nonsense #
##########################

## Python/Virtualenv
export VIRTUALENV_DISTRIBUTE=true                     # virtualenv should use Distribute instead of legacy setuptools
export PIP_VIRTUALENV_BASE=$HOME/Projects/Virtualenvs # Centralized location for new virtual environments
export PIP_REQUIRE_VIRTUALENV=true                    # pip should only run if there is a virtualenv currently activated
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache            # cache pip-installed packages to avoid re-downloading

