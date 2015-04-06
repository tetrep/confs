mesg n # don't let others write to our terminal...

PATH="${PATH}:${HOME}/.rvm/bin" # Add RVM to PATH for scripting
PATH="${PATH}:${HOME}/bin" # dat binary
PATH="${PATH}:${HOME}/Downloads/adt-bundle-mac-x86_64-20130729/sdk/platform-tools" # sweet, sweet, adb
PATH="${PATH}:${HOME}/research/android/android-ndk-r9b" # dat nkd-build
PATH="${PATH}:${HOME}/projects/meta_util/bin" # our personal binaries
export PATH="${HOME}/.rbenv/bin:${PATH}"

eval "$(rbenv init -)"

export EDITOR='vim'

export CLICOLOR=1

# ppmmake colors
export RGBDEF='/opt/X11/share/X11/rgb.txt'

#zsh auto complete
autoload -U compinit && compinit
setopt COMPLETE_IN_WORD #try to complete at cursor
zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#colors! %{%F{color}%}
autoload -U colors && colors

#left prompt [(127)username@computer:~]%:
PS1="%{%F{red}%}%(2L.+.)%(?..(%?%))" #return value of previous command, if non 0
PS1="${PS1}%{%F{default}%}[" #[
PS1="${PS1}%{%F{yellow}%}%n%{%F{default}%}@%{%F{green}%}%m" #user@computer
PS1="${PS1}%{%F{default}%}:%{%F{cyan}%}%1~" #folder
PS1="${PS1}%{%F{default}%}]" #]
PS1="${PS1}%{%F{default}%} %*" # HH:MM:SS
PS1="${PS1}
%{%F{blue}%}%#%{%F{default}%} " #% or #
export PS1
#right prompt HH:MM:SS
#export RPROMPT="%*"

#history settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${HOME}/.history_zsh"
setopt INC_APPEND_HISTORY # append history as it occurs, rather than upon shell exit
setopt SHARE_HISTORY # share history between running shells (doesn't fuck with !!)
setopt EXTENDED_HISTORY # add time and how long command was run to history
setopt HIST_IGNORE_DUPS # ignore adjacent duplicate history
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicate history entries (even non-adjacent) when history fills up
setopt HIST_FIND_NO_DUPS # don't display dups when displaying history
setopt HIST_REDUCE_BLANKS # removes meaningless whitespace while entering commands into history

# change title of iterm tab to current folder
if [ $ITERM_PROFILE ]; then
  precmd() { echo -ne "\033]0;${PWD##*/}\007"; }
fi
