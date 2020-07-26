source ~/.zplug/init.zsh
export PATH=$HOME/.cargo/bin:$PATH
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export LC_TIME=en_GB.utf8
export PATH=$HOME/.local/bin:$PATH
EDITOR="nvim"

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Self manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Then, source plugins and add commands to $PATH
zplug load 

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Example aliases
 alias zshrc="nvim ~/.zshrc"
 alias vim="nvim"
 alias "ssh raspberry"="ssh spi@raspberry -p 42069"
 alias ls='exa -al --color=always --group-directories-first' # my preferred listing
 alias la='exa -a --color=always --group-directories-first'  # all files and dirs
 alias ll='exa -l --color=always --group-directories-first'  # long format
 alias lt='exa -aT --color=always --group-directories-first' # tree listing
# bare git repo alias for dotfiles
 alias dfile="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
# alias gs='git status '
# alias ga='git add '
# alias gb='git branch '
# alias gc='git commit'
# alias gd='git diff'
# alias go='git checkout '
# alias gk='gitk --all&'
# alias gx='gitx --all'
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sysp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
