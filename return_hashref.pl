#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub list_to_hash {
    my %hash = @_;
    return \%hash; # return {@_};
}

my $rh = list_to_hash(@ARGV);
say pp($rh);

