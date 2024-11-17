#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';


sub search_firstname {
    my ($key, $arr_ref) = @_;
    my @array = @$arr_ref;
    my @result;

    foreach my $hash (@array){
        if($$hash{'firstname'} eq $key){
            push @result, $hash;
        }
    }

    # 基本功三个字, 臣妾都说倦了
    # my @matches = grep { $_->{firstname} eq $match } @$rah_phonebook;

    return \@result;
}

my $rah_results = search_firstname ($ARGV[0] || '', [
    { firstname => 'Bill', surname => 'Smith',    phone => 123123213 },
    { firstname => 'Anne', surname => 'Taylor',   phone => 123123213 },
    { firstname => 'Bill', surname => 'Sinclair', phone => 9999 }
]);


say pp($rah_results);

