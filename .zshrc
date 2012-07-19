#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
if [[ -f /etc/zshrc ]]; then
  . /etc/zshrc
fi

bindkey -e # emacs style keybindings

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=200

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

autoload -U colors
colors

REPORTTIME=20

alias screen='echo "Did you mean tmux?"'
alias ack='ack --color'
alias less='less -R'
alias gdb='gdb -tui --args'
export EDITOR=vim
export WORKSPACE=$HOME/workspace

