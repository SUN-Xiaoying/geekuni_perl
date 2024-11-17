#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

sub isbn_catalog {
    # it is generally recommended to unpack @_ into named variables for 
    # better readability and to avoid potential issues with modifying the original arguments.

    my ($books_ref) = @_;
    my %catagory;

    for my $book (@$books_ref) {
        my ($year, $isbn, $title, @authors) = @$book;

        $catagory{$isbn} = {
            authors => \@authors,
            publication_year => $year,
            title => $title,
        }
    }
    return \%catagory;
}

my $rh_catalog = isbn_catalog([
    ['1998', '978-0-8001-0215-9', 'Glory', 'Freddie Fields', 'P.K. Fields', 'Pieter Jan Brugge'],
    ['1998', '978-0-8001-2901-9','The Whole Town\'s Talking', 'Joseph H. August','John Ford']
])
;

say pp($rh_catalog);

