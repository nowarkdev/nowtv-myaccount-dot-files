# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER="user"
#ZSH_THEME="agnoster"
ZSH_THEME="dracula"

POWERLINE_HIDE_USER_NAME="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_DETECT_SSH="true"

POWERLINE_RIGHT_A="mixed"
POWERLINE_DATE_FORMAT="%D{%d-%m}"

export EDITOR=vim

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git github bundler rails vagrant per-directory-history extract)

# Source TMUXinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

source $ZSH/oh-my-zsh.sh

#Color listing
[[ -f dircolors ]] && eval $(dircolors ~/.homesick/repos/bskyb-commerce/sky-dotfiles/home/dircolors/dircolors.ansi-dark)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

#source ~/.cinderella.profile

# DYLD_LIBRARY_PATH - For mysql and mysql2 gem
# export DYLD_LIBRARY_PATH="~/Developer/Cellar/mysql/5.5.19/lib:$DYLD_LIBRARY_PATH"

# AutoJump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

export EDITOR_X_HTTP_AUTHORIZATION='3ebd89253c6cfe6e8c3afd559ca8899bd0c2609ce87ae98915f760d3ed10098c'

PATH=~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH
eval "$(rbenv init -)"

#. ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
