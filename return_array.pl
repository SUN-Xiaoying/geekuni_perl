#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub string_lengths {
    my @params = @_;
    # TODO - implement me...
    # and make sure @ARGV is not used inside this subroutine!
    my @result;
    foreach my $param (@params) {
        push @result, length($param);
    }
    return @result;

    # return map { length($_) } @params;
    # Format transfer
}

my @lengths = string_lengths(@ARGV);
say 'String lengths: '.pp(@lengths);
