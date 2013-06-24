#!/bin/bash
############################
# functions.sh
# This script contains some custom functions to shell
############################

# A little function to plot the distribution of values passed through a pipe
function dist(){
  sort |  uniq -c | awk '{ b=""; for(i=0;i<$1;i++){ b=b"#"}; v=$1; $1=""; print $0,"\t",b,v }'
}


# Useful extract feature so you don't have to remember the arguments to extract
# all of the various archive formats
function extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2) tar xvjf $1 ;;
           *.tar.gz) tar xvzf $1 ;;
           *.bz2) bunzip2 $1 ;;
           *.rar) unrar x $1 ;;
           *.gz) gunzip $1 ;;
           *.tar) tar xvf $1 ;;
           *.tbz2) tar xvjf $1 ;;
           *.tgz) tar xvzf $1 ;;
           *.zip) unzip $1 ;;
           *.Z) uncompress $1 ;;
           *.7z) 7z x $1 ;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}
