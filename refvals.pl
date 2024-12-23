#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';


my $string = 'String';
say '$string is a '.pp(ref($string));

my $stringref = \$string;
say '$stringref is a '.pp(ref($stringref));

my @array = (1,2,3,4);
say '@array is a '.pp(ref(@array));

my $arrayref = \@array;
say '$arrayref is a '.pp(ref($arrayref));

my %hash = (this => 1, that=>2);
say '%hash is a '.pp(ref(%hash));

my $hashref = \%hash;
say '$hashref is a '.pp(ref($hashref));