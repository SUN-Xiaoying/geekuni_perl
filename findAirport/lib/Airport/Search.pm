#!/usr/bin/perl
package Airport::Search;
use strict;
use warnings;
use Math::Trig qw/great_circle_distance :pi/;

sub get_latlong_matching_airports {
    my %args = @_;

    my $airports = $args{airports}; # Array reference to the list of airports
    my $lat      = $args{lat};      # Latitude
    my $long     = $args{long};     # Longitude
    my $max      = $args{max};      # Maximum distance in degrees

    my @matching_airports;

    for my $airport (@$airports) {
        my $airport_lat  = $airport->{latitude_deg};
        my $airport_long = $airport->{longitude_deg};

        # Convert degrees to radians
        my ($lat_r, $long_r)   = map { $_ * (pi / 180) } ($lat, $long);
        my ($airport_lat_r, $airport_long_r) = map { $_ * (pi / 180) } ($airport_lat, $airport_long);

        # Compute the great circle distance
        my $dist_radians = great_circle_distance($lat_r, $long_r, $airport_lat_r, $airport_long_r);

        # Convert the distance from radians to degrees
        my $dist_degrees = $dist_radians * (180 / pi);

        if ($dist_degrees <= $max) {
            push @matching_airports, $airport;
        }
    }

    return \@matching_airports;
}

1;
