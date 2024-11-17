#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

my %hash = (this=>1, is=>2);
my $hashref = {this=>1, is=>2};

sub check_ref {
    if (ref($_[0])) {
        say "$_[0] is a reference!";
    } else {
        say "$_[0] is NOT a reference!";
    }
}

# Example calls
say "Array reference\n";
check_ref([1, 2, 3]); 
say "Hash reference\n";
check_ref({a => 1});    
say "Hash\n";
check_ref((this=>1, is=>2));   

