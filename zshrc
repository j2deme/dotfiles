export TERM="xterm-256color"
source ~j2deme/Repos/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle autojump
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme kphoen
#antigen theme bhilburn/powerlevel9k powerlevel9k
#antigen apply

# Tell antigen that you're done.
antigen apply

#source /home/j2deme/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    #zle autosuggest-start
}

zle -N zle-line-init

# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kphoen"
#ZSH_THEME="norm"

# Example aliases
alias zshconfig="subl ~/dotfiles/zshrc && source ~/dotfiles/zshrc"
alias resource="source ~/dotfiles/zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias sii="cd ~/Webdev/SII/"
alias web="cd ~/Webdev/"
alias batt=acpi
alias cleant="sudo rm -R ~/.cache/thumbnails/fail"
alias diff="diff -rwb"
#alias git=hub
alias gti=git
alias lsd='ls -l | grep "^d"'
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias bower="noglob bower"
alias ggg='noglob gg'
alias open="xdg-open"
alias nano="nano -DHOSWkimAE -r 100"
alias poogle='ping google.com'

# npm
#alias npmp="sudo npm publish"
#alias npma="sudo npm adduser"
#alias npmi="sudo npm install"
#alias npmg="sudo npm install -g"
#alias npmu="sudo npm update"
#alias npmr="sudo npm uninstall"
#alias npmrg="sudo npm uninstall -g"

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
#plugins=(git github sublime extract python pip npm)

#source $ZSH/oh-my-zsh.sh
source /home/j2deme/Apps/resty

# Customize to your needs...
export PATH=$PATH:$HOME/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/bin
export PATH=$HOME/local/bin:$PATH
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin":$PATH
# SYBASE
export SYBASE_JRE7="/usr/lib/jvm/java-8-oracle/jre"
export SYBASE="/opt/sybase"
export SYBROOT=$SYBASE

#
# Sybase Product Environment variables
#
SCC_HOME=${SYBROOT}/SCC-3_2
SYBASE_JRE6_32="${SYBROOT}/shared/JRE-6_0_24_32BIT"
export SYBASE_JRE6_32
SYBASE_JRE6="${SYBROOT}/shared/JRE-6_0_24_64BIT"
export SYBASE_JRE6
SYBASE_JRE7_32="${SYBROOT}/shared/JRE-7_0_7_32BIT"
export SYBASE_JRE7_32
SYBASE_JRE7="${SYBROOT}/shared/JRE-7_0_7_64BIT"
export SYBASE_JRE7
SYBASE_JRE7_64="${SYBROOT}/shared/JRE-7_0_7_64BIT"
export SYBASE_JRE7_64
SYBASE_OCS="OCS-15_0"
export SYBASE_OCS
INCLUDE="${SYBROOT}/OCS-15_0/include":$INCLUDE
export INCLUDE
LIB="${SYBROOT}/OCS-15_0/lib":$LIB
export LIB
PATH="${SYBROOT}/OCS-15_0/bin":$PATH
export PATH
LD_LIBRARY_PATH="${SYBROOT}/OCS-15_0/lib:${SYBROOT}/OCS-15_0/lib3p64:${SYBROOT}/OCS-15_0/lib3p":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
LD_LIBRARY_PATH="${SYBROOT}/DataAccess/ODBC/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
LD_LIBRARY_PATH="${SYBROOT}/DataAccess64/ODBC/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
PATH="${SYBROOT}/DBISQL/bin":$PATH
export PATH
PATH="${SYBROOT}/SCC-3_2/bin":$PATH
export PATH
SCC_JAVA_HOME="${SYBROOT}/shared/JRE-7_0_7_64BIT"
export SCC_JAVA_HOME
SYBASE_ASE="ASE-15_0"
export SYBASE_ASE
PATH="${SYBROOT}/ASE-15_0/bin:${SYBROOT}/ASE-15_0/install":$PATH
export PATH
SYBASE_JRE_RTDS="${SYBROOT}/shared/JRE-7_0_7_64BIT"
export SYBASE_JRE_RTDS
LD_LIBRARY_PATH="${SYBROOT}/ASE-15_0/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
SYBASE_WS="WS-15_0"
export SYBASE_WS
PATH="${SYBROOT}/ASE-15_0/jobscheduler/bin":$PATH
export PATH
