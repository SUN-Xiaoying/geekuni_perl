#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub get_max_value_key {
  my %hash_args = @_;
  # TODO: Implement me!
  my @ranked_keys = sort { $hash_args{$b} <=> $hash_args{$a} } keys(%hash_args);
    
return $ranked_keys[0];

}

my %exam_marks = (anna => 85, bob => 96, chloe => 78, dave => 64);

say 'Highest mark awarded to '.get_max_value_key(%exam_marks);

