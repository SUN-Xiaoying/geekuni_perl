#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

# Check for correct number of arguments
if (@ARGV != 2) {
    die "Usage: $0 input_file output_file\n";
}

my ($infile, $outfile) = @ARGV;

# Create the CSV object
my $csv = Text::CSV->new({ binary => 1, eol => $/ });

# Open the input and output files
open(my $fh_in, "<:encoding(utf8)", $infile) or die "Error opening input file '$infile': $!";
open(my $fh_out, ">:encoding(utf8)", $outfile) or die "Error opening output file '$outfile': $!";

# Read the first row (column headers)
my $ra_colnames = $csv->getline($fh_in);
$csv->print($fh_out, $ra_colnames); # Write column headers to output file

# Find the index of the 'iata_code' column
my $iata_idx;
for my $i (0 .. $#$ra_colnames) {
    if ($ra_colnames->[$i] eq 'iata_code') {
        $iata_idx = $i;
        last;
    }
}

# Check if 'iata_code' column exists
die "Column 'iata_code' not found in input file\n" unless defined $iata_idx;

# Process the rest of the rows
while (my $ra_row = $csv->getline($fh_in)) {
    # Check if the IATA code is non-empty and non-zero
    if (defined $ra_row->[$iata_idx] && $ra_row->[$iata_idx] ne '' && $ra_row->[$iata_idx] ne '0') {
        $csv->print($fh_out, $ra_row); # Write matching row to output file
    }
}

# Close the filehandles
close($fh_in);
close($fh_out);

print "Filtered IATA airports saved to $outfile\n";
