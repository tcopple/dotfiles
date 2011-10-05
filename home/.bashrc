# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

FG='\[\033[38;5;119m\]'
NONE='\[\033[00;0m\]'
BBLK='\[\033[01;30m\]'

# Calculate a short checksum of the real hostname to determine a unique color
if [ $TERM == "xterm-256color" ]; then
  host_color="38;5;$((16 + $(hostname | cksum | cut -c1-3) % 256))";
else
   host_color="1;$((31 + $(hostname | cksum | cut -c1-3) % 6))";
fi

PS1='\[\033['$host_color'm\]\H'$BBLK':'$NONE' '
export PS1

set -b
set -o vi
export EDITOR=vim

cd() {
  if [[ $@ == '-' ]]; then
    builtin cd "$@" > /dev/null  # We'll handle pwd.
  else
    builtin cd "$@"
  fi
  echo -e "   \033[1;30m"`pwd`"\033[0m"
}

mine
