#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
if [[ -f /etc/zshrc ]]; then
  . /etc/zshrc
fi

bindkey -e # emacs style keybindings

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

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
SAVEHIST=400

setopt hist_ignore_all_dups

# Automatically rehash
zstyle ':completion:*' rehash true

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

## Fancy git prompt magic
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

# git specific completions are too slooooow
compdef -d git

error_code() {
  # make sure to get the err code first before any commands we execute here write over it
  local ret=$?
  local errcode=""

  if [ "$ret" -gt 0 ]
  then
    #errcode="${RED}[${ret}]${DEFAULT}"
    errcode="%{$fg[magenta]%}[%{$fg[red]%}${ret}%{$fg[magenta]%}]%{$reset_color%}"
  else
    #errcode="${LCYAN}[☺]${DEFAULT}"
    errcode="%{$fg[magenta]%}[%{$fg[cyan]%}☺%{$fg[magenta]%}]%{$reset_color%}"
  fi
  echo $errcode
}
prompt_time     () { echo "%{$fg[magenta]%}[%{$fg[cyan]%}%D{%Y-%b-%e %a %T}%{$fg[magenta]%}]%{$reset_color%}" }
prompt_username () { echo "%{$fg[green]%}%n%{$reset_color%}"     }
prompt_at       () { echo "%{$fg[magenta]%}@%{$reset_color%}"    }
prompt_machine  () { echo "%{$fg[green]%}%M%{$reset_color%}"     }
prompt_path     () { echo "%{$fg[white]%}%~%{$reset_color%}"     }
prompt_pathsep  () { echo "%{$fg[magenta]%}:%{$reset_color%}"    }
prompt_end      () { echo "\n%{$fg[magenta]%}$%{$reset_color%} " }
PROMPT=$'$(error_code)'$'$(prompt_time)'$'$(vcs_info_wrapper)'$'$(prompt_username)'$'$(prompt_at)'$'$(prompt_machine)'$'$(prompt_pathsep)'$'$(prompt_path)'$'$(prompt_end)'
## end Fancy git prompt magic

autoload -U colors
colors

# zmv is nice for renaming batches of files according to some pattern
autoload -U zmv

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^o' edit-command-line
export KEYTIMEOUT=1

autoload -U select-word-style
select-word-style bash

# For OSX:
export CLICOLOR=1

REPORTTIME=20

alias screen='echo "Did you mean tmux?"'
alias ack='ack --color'
alias less='less -R'
alias gdb='gdb -tui --args'
alias vim='vim -p'
alias ls='ls -F'
alias emacs='Emacs -nw'
alias grep=ggrep
export EDITOR=vim
export WORKSPACE=$HOME/workspace
export PATH=/Applications/Isabelle2013-2.app/Isabelle/bin:/Applications/CoqIdE_8.4pl4.app/Contents/Resources/bin:/Applications/Emacs.app/Contents/MacOS:$HOME/local-install/bin:/usr/local/bin:$WORKSPACE/bin:$HOME/.cabal/bin:/opt/local/bin:$PATH

# For sailfan:
export MONO_PATH=/Library/Frameworks/Mono.framework/Libraries/mono/4.5

# Rust
export RUST_BACKTRACE=1
export LIBRARY_PATH=/usr/local/lib
export HOMEBREW_GITHUB_API_TOKEN=9cd4a6c9c674801ac07c0dd303e66fd0b7b1b94f
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
