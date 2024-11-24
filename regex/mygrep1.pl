#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my $match = shift @ARGV;
my $filename = shift @ARGV;

open(my $fh, '<', $filename);

while (my $line = <$fh>) {
    if ($line =~ m/$match/){
        say $line;
    }
}

close($fh);