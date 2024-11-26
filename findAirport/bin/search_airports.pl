#!/usr/bin/perl -Ilib  -Iextlib/lib/perl5

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';
use Getopt::Long;
use Text::CSV;
use Airport::Data;
use Airport::Search;

my $filename = '/home/student/perl-basic/topic-07/iata_airports.csv';
my $number = 3;
my $matching = 'None';
my $latitude =0.00;
my $longitude=0.00;
my $word;
my $address;
my $distance = 2;
my $max = 2;

GetOptions ("filename=s" => \$filename, 
            "number=i" => \$number,
            "matching=s" => \$matching,    
            "latitude=f"   => \$latitude,     
            "longitude=f"  => \$longitude, 
            "word=s" => \$word,
            "address=s" => \$address,
            "distance=f" => \$distance)  
or die("Error in command line arguments\n");

# Get the airports data from the file
my $rah_airports = Airport::Data::parse_airports($filename);
my $matching_airports = [];

# Main script logic
if ($matching && $matching ne 'None') {
    say "Up to $number airports matching '$matching' in $filename:\n";
    
    # Get the name-matching airports
    $matching_airports = Airport::Search::get_name_matching_airports(
        airports        => $rah_airports,
        matching_string => $matching,
        word            => $word,
    );
}
elsif ($latitude && $longitude) {
    say "Up to $number airports near [$latitude, $longitude] within in $filename:\n";

    # Get the proximity-matching airports
    $matching_airports = Airport::Search::get_latlong_matching_airports(
        airports => $rah_airports,
        lat      => $latitude,
        long     => $longitude,
    );
}
else {
    say "Must have at least --matching, or --latitude and --longitude as arguments.";
}

 # Print matching airports
print pp($matching_airports);
