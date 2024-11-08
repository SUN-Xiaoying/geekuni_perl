#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dump 'pp';

my $INFO;

sub wantchecker {
    if (wantarray) {
        $INFO = 'you want an array';
        return ('this', 'is', 'a', 'list');
    }
    $INFO = 'you want a string';
    return 'you want nothing';
}

my $str = wantchecker();
say '$INFO = '.$INFO.' $str = '.$str;

my @arr = wantchecker();
say '$INFO = '.$INFO.' @arr = '.pp(@arr);

my %hash = wantchecker();
say '$INFO = '.$INFO.' %hash = '.pp(%hash);


wantchecker();
say '$INFO = '.$INFO;

