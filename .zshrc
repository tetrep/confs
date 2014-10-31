mesg n #don't let others write to our terminal...

PATH="${PATH}:${HOME}/.rvm/bin" # Add RVM to PATH for scripting
PATH="${PATH}:${HOME}/bin" #dat binary
PATH="${PATH}:${HOME}/Downloads/adt-bundle-mac-x86_64-20130729/sdk/platform-tools" #sweet, sweet, adb
PATH="${PATH}:${HOME}/research/android/android-ndk-r9b" #dat nkd-build
export PATH="${HOME}/.rbenv/bin:${PATH}"

eval "$(rbenv init -)"

export EDITOR='vim'

export PS1="[%(2L.+.)%(?..(%?%))%n@%m:%1~]%#:"

export CLICOLOR=1

#history settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE='~/.history_zsh'
setopt INC_APPEND_HISTORY #append history as it occurs, rather than upon shell exit
setopt SHARE_HISTORY #share history between running shells (doesn't fuck with !!)
setopt EXTENDED_HISTORY #add time and how long command was run to history
setopt HIST_IGNORE_DUPS #ignore adjacent duplicate history
setopt HIST_EXPIRE_DUPS_FIRST #delete duplicate history entries (even non-adjacent) when history fills up
setopt HIST_FIND_NO_DUPS #don't display dups when displaying history
setopt HIST_REDUCE_BLANKS #removes meaningless whitespace while entering commands into history

#change title of iterm tab to current folder
if [ $ITERM_PROFILE ]; then
  precmd() { echo -ne "\033]0;${PWD##*/}\007"; }
fi
