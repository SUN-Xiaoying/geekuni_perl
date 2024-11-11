#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

sub modify_string_exclaim {
    my ($r_str) = @_;

    ## FILL THIS IN to add an exclamation mark at the end of the string
    $$r_str .= "!";

    return 1; ## Have to return something?
}

my $sc = 'Hello';
say $sc; # Output: Hello

modify_string_exclaim(\$sc);
say $sc; # Output: Hello!

