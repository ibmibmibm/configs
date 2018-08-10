#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ "$TERM" = "xterm" ] && export TERM="xterm-256color"
export EDITOR="vim"
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/.local/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/.local${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/beststeve/.local\""
export PERL_MM_OPT="INSTALL_BASE=/home/beststeve/.local"
export GOPATH=$HOME/gocode
export PYTHONPATH=$HOME/.vim/bundle/repos/github.com/powerline/powerline
export PARALLEL_SHELL=/bin/bash
export GPG_TTY=$(tty)

$HOME/.vim/bundle/repos/github.com/powerline/powerline/scripts/powerline-daemon -q
exec fish
