#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my ($pattern, $filename) = @ARGV;

# Open the file
open my $fh, '<', $filename or die "Could not open '$filename': $!\n";

while (my $line = <$fh>) {
    my @words = split /(\s+)/, $line; 
    foreach my $word (@words) {
        $word =~ s/\b(\w*($pattern)\w*)\b/\U$1/gi; 
    }
    say join('', @words);
}

close $fh;