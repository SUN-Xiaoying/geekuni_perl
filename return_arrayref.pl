#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub arrayref {
     return \@_;
}

my $ra_args = arrayref(@ARGV);

say pp($ra_args);
