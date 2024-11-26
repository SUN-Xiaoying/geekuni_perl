#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

# Default values for the options
my $filename = '/home/student/perl-basic/topic-07/iata_airports.csv';
my $number   = 1;
my $matching;
my $word     = 0; # Boolean defaults to false
my $latitude;
my $longitude;

# Parse command-line options
GetOptions(
    'filename=s'  => \$filename,   # string
    'number=i'    => \$number,     # integer
    'matching=s'  => \$matching,   # string
    'word!'       => \$word,       # boolean (with no argument)
    'latitude=f'  => \$latitude,   # floating point
    'longitude=f' => \$longitude,  # floating point
) or die "Error in command-line arguments. Usage: $0 [options]\n";

# Determine the search mode and print parameters
if (defined $matching) {
    print "Up to $number airports matching '$matching' in $filename:\n";
    print "Whole word matching: ", ($word ? "enabled" : "disabled"), "\n";
} elsif (defined $latitude && defined $longitude) {
    print "Up to $number airports near [$latitude, $longitude] in $filename:\n";
} else {
    die "Please specify either --matching <string> or --latitude <number> --longitude <number>.\n";
}
