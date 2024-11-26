# ChatGPT
#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dump 'pp';
use Teach::Tutor; # Don't forget to call: submit(<variable>);

# Ensure there are enough arguments
if (@ARGV < 2) {
    die "Usage: $0 <matching_string> <list_of_elements>\n";
}

# Extract the first argument as the matching string
my $match_string = shift @ARGV;

# Use grep to filter elements that do NOT match the pattern
my @non_matches = grep { !/$match_string/ } @ARGV;

# Print the resulting array
print "(", join(", ", map { qq("$_") } @non_matches), ")\n";

submit(@non_matches);

# Reference
#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dump 'pp';
use Teach::Tutor; # Don't forget to call: submit();

my $str = shift(@ARGV);

my @antimatch = grep { !/$str/ } @ARGV;
print pp(@antimatch);
submit(@antimatch);