#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dump 'pp';

my @arr = ([1 .. 6], [1,2,3] , ['a' .. 'h']);

sub by_arr_length {
    # TODO implement this sort metric
    return scalar(@$a) <=> scalar(@$b);
};

my @barr = sort by_arr_length @arr;

say 'Unsorted: '.pp(\@arr);
say 'Sorted: '.pp(\@barr);
# @barr should now be ([1, 2, 3], [1 .. 6], ["a" .. "h"])

