#!/usr/bin/env perl
use Getopt::Std;
use strict;
use Term::ANSIColor;

my %opts;
getopts('hic:l:',\%opts);
    if ($opts{h}){
      print<<EoF;
Use -l to specify the pattern(s) to highlight. To specify more than one
pattern use commas.

-l : A Perl regular expression to be colored. Multiple expressions can be
     passed as comma separated values: -l foo,bar,baz
-i : makes the search case sensitive
-c : comma separated list of colors;

EoF
      exit(0);
    }

my $case_sensitive=$opts{i}||undef;
my @color=('bold red','bold blue', 'bold yellow', 'bold green',
           'bold magenta', 'bold cyan', 'yellow on_magenta',
           'bright_white on_red', 'bright_yellow on_red', 'white on_black');
if ($opts{c}) {
   @color=split(/,/,$opts{c});
}
my @patterns;
if($opts{l}) {
     @patterns=split(/,/,$opts{l});
} else {
    $patterns[0]='\*';
}

# Setting $| to non-zero forces a flush right away and after
# every write or print on the currently selected output channel.
$|=1;

while (my $line=<>) {
  for (my $c=0; $c<=$#patterns; $c++) {
    if($case_sensitive) {
      if($line=~/$patterns[$c]/) {
        $line=~s/($patterns[$c])/color("$color[$c]").$1.color("reset")/ge;
      }
    } else {
      if($line=~/$patterns[$c]/i) {
        $line=~s/($patterns[$c])/color("$color[$c]").$1.color("reset")/ige;
      }
    }
  }
  print STDOUT $line;
}
