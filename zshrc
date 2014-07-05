# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"
#ZSH_THEME="norm"

# Example aliases
alias zshconfig="subl ~/dotfiles/zshrc && source ~/dotfiles/zshrc"
alias resource="source ~/dotfiles/zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias sii="cd ~/Webdev/SII/"
alias web="cd ~/Webdev/"
alias batt=acpi
alias cleant="sudo rm -R ~/.cache/thumbnails/fail"
alias diff="colordiff -rwb"
alias git=hub
alias gti=git
alias lsd='ls -l | grep "^d"'
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias bower="noglob bower"
alias open="xdg-open"
alias lns="ln -s"
alias nano="nano -DHOSWkimAE -r 100"
alias poogle='ping google.com'

# npm
alias npmp="sudo npm publish"
alias npma="sudo npm adduser"
alias npmi="sudo npm install"
alias npmg="sudo npm install -g"
alias npmu="sudo npm update"
alias npmr="sudo npm uninstall"
alias npmrg="sudo npm uninstall -g"

alias please=sudo
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract python pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/bin
export PATH=$HOME/local/bin:$PATH
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

BASE16_SCHEME="bright"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

newprj() {
  local TARGET="$HOME/Projects/${*}"
  mkdir -p "$TARGET"
  cd "$TARGET"
}

calc() {
  bc -l <<< "$@"
}
# calc(){ awk "BEGIN{ printf(\"%.7g\n\",$*) }" ;}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
      echo "'$1' is not a valid file"
   fi
}

ft() {
  find . -name "$2" -exec grep -il "$1" {} \;
}

ltree(){
  tree -C $* | less -R
}

notify (){
  ($* ; notify-send "Command over" "$*")
}
