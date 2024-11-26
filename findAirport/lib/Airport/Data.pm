#!/usr/bin/perl
package Airport::Data;

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';
use Getopt::Long;
use Text::CSV;

# Default values for the options
my $filename = 't/data/airports1.csv';
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
    'longitude=f' => \$longitude,  # floating 
) or die "Error in command-line arguments. Usage: $0 [options]\n";

# Subroutine to parse airports
sub parse_airports {
    my ($file) = @_;
    my $csv = Text::CSV->new({ binary => 1, eol => $/ });

    open my $fh, '<:encoding(utf8)', $file or die "Cannot open file '$file': $!";
    
    my $ra_colnames = $csv->getline($fh);
    $csv->column_names(@$ra_colnames);
    
    my $ra_airports = $csv->getline_hr_all($fh);

    close $fh;
    return $ra_airports;  # Arrayref of hashrefs
}

# Subroutine to find airports by name matching
sub get_name_matching_airports {
    my (%args) = @_;
    my $airports        = $args{airports};
    my $matching_string = $args{matching_string};
    my $word            = $args{word};

    # Prepare the regex for case-insensitive matching
   my $regex = $word 
        ? qr/\b\Q$matching_string\E\b/i  # Whole word match, case insensitive
        : qr/\Q$matching_string\E/i;

    # Filter airports based on the name field
    my @matches = grep { $_->{name} =~ $regex } @$airports;

    return \@matches;
}

1;
 