#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub array_intersection {
  my ($ra_x, $ra_y) = @_;

  my @intersection;
  while (my $x = pop(@$ra_x)) {
    foreach my $y (@$ra_y) {
      if ($x == $y) {
        push @intersection, $x;
      }
    }
  }

  my @sorted = sort(@intersection);
  return \@sorted;
}

my $ra_first = [1,2,3,4,5,6];
my $ra_second = [2,4,6,8,10];

my $ra_intersection = array_intersection($ra_first, $ra_second);
say "The intersection of ".pp( $ra_first )." and ".pp($ra_second)." is ".
  pp($ra_intersection);

