#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Data::Types qw(is_float);
use_ok('Airport::Data'); # This should be the module you're testing

ok(1, '1 is always true');
is(1, "1", '1 is "1" according to "is"');
isnt(1, 0, '1 is not 0');
# FIXME write some proper tests
# Call the method to test
my $result = Airport::Data::parse_airports("t/data/airports1.csv");

# Test if the return value is an array reference
ok(ref($result) eq 'ARRAY', 'parse_airports returns the correct type');

# Test if there are 5 elements in the array reference
is(scalar(@$result), 5, 'parse_airports returns the correct number of elements');

# Test each element in the array
foreach my $airport (@$result) {
    # Check if each element is a hash reference
    ok(ref($airport) eq 'HASH', 'Each element is a hash reference');

    # Check required keys and non-empty values
    foreach my $key (qw(id name latitude_deg longitude_deg iata_code)) {
        ok(exists $airport->{$key}, "Key $key exists in the hash reference");
        ok($airport->{$key} ne '', "Value for $key is non-empty");
    }
    
    ok(is_float($airport->{latitude_deg}), 'latitude_deg is a floating point number');
    ok(is_float($airport->{longitude_deg}), 'longitude_deg is a floating point number');
}


done_testing;
