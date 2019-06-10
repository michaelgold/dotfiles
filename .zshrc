case $(uname -a) in
   *Microsoft*) unsetopt BG_NICE ;;
esac

export TERM="xterm-256color"

# printer user name

source $HOME/antigen.zsh
ANTIGEN_LOG=$HOME/.log/antigen.log

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


antigen bundle zsh-users/zsh-history-substring-search

antigen bundle zsh-users/zsh-autosuggestions


# Load the theme.
#antigen theme robbyrussell


 
# Powerlevel9k config
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='nerdfont-complete'
 
# Dir segment
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
 
# Vcs segment aka git
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
 
# Time segment
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uE868  %d.%m.%y}"
 
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ip battery dir vcs)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ip dir vcs)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)



# POWERLEVEL9K_CUSTOM_TWTASK_ID="echo $(task _get `task +ACTIVE ids`.id)"
# POWERLEVEL9K_CUSTOM_TWTASK_ID_FOREGROUND="black"
# POWERLEVEL9K_CUSTOM_TWTASK_ID_BACKGROUND="yellow"
# 
# 
# 
# POWERLEVEL9K_CUSTOM_TWTASK="echo $(task _get `task +ACTIVE ids`.description)"
# POWERLEVEL9K_CUSTOM_TWTASK_FOREGROUND="white"
# POWERLEVEL9K_CUSTOM_TWTASK_BACKGROUND="blue"
# 
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode custom_twtask_id custom_twtask time)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode time)





POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"



# antigen theme bhilburn/powerlevel9k powerlevel9k --branch=next
antigen theme bhilburn/powerlevel9k powerlevel9k



alias t="task"
alias tn="task next"
alias tg="task _get"
alias tw="vim -c 'TW'"
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias pycharm="/mnt/c/Users/goldm/AppData/Local/JetBrains/Toolbox/apps/PyCharm-P/ch-0/191.7479.30/bin/pycharm64.exe"
export PATH="/opt/anaconda3/bin:$HOME/.local/bin:$PATH"

# Tell Antigen that you're done.
antigen apply
bindkey "fd" vi-cmd-mode
bindkey 'fg' autosuggest-accept

export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
# source /usr/local/bin/virtualenvwrapper.sh

