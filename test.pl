#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';
{
    package Foo;
    sub bar {
        my ($self, $val) = @_;

        return "Returning $val";
    }
}

say Foo->bar(2);