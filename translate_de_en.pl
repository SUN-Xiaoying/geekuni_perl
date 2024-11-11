#!/usr/bin/perl

# $ ./translate_de_en ich bin ein berliner
# I am a berliner
# $ ./translate_de_en

# $

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';


sub translate {
    ## FILL THIS IN
    my (%hash, @arr) = @_;
    foreach my $word (@arr) {
        if(exists $hash{$word}){
            $word = $hash{$word};
        }
    }
    return [@arr];
}

my $ra_en_de_xlat = translate({
    ich => 'I',
    bin => 'am',
    ein => 'a',
}, [@ARGV]);

say join(' ',@$ra_en_de_xlat);

# my @array = ('x', 'b', 'y', 'a');

# # Iterate through the array and attempt to modify $element
# foreach my $element (@array) {
#     print "Original element: $element\n";
#     $element = 'changed';  # Attempt to modify $element
#     print "Modified element inside loop: $element\n";
# }

# # Print the array to see if it changed
# print "Array after loop: @array\n";