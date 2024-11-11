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
    my ($hash_ref, $arr_ref) = @_;  # Accept references

    # Dereference the hash and array
    my %hash = %{$hash_ref};
    my @arr = @{$arr_ref};

    # Modify array elements by index
    for my $i (0 .. $#arr) {
        if (exists $hash{$arr[$i]}) {
            $arr[$i] = $hash{$arr[$i]};
        }
    }

    return \@arr;
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