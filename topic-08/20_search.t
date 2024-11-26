#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use_ok('Airport::Search'); # This should be the module you're testing

ok(1, '1 is always true');
is(1, "1", '1 is "1" according to "is"');
isnt(1, 0, '1 is not 0');
# FIXME write some proper tests

#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Airport::Search;

# Example airport data with latitude_deg and longitude_deg
my @airports = (
    { iata_code => "green", id => 1, latitude_deg => 1.1, longitude_deg => 4.1, name => "Foo international" },
    { iata_code => "blue", id => 2, latitude_deg => 2.1, longitude_deg => 3.1, name => "Bar domestic" },
);

# Test: Airports within a very small distance (0.002)
my $result = Airport::Search::get_latlong_matching_airports(
    airports => \@airports,
    lat      => 1.1001,
    long     => 4.1001,
    max      => 0.002,
);

is(scalar @$result, 1, 'Returned the correct number of airports (1)');
is($result->[0]{iata_code}, "green", 'Returned the correct airport ("green")');

done_testing;