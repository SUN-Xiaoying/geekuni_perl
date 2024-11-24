#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my $match = shift @ARGV;
my @newargs = map { $_ =~ m/$match/ ? uc($_) : $_ } @ARGV;

say join(' ',@newargs);

# #!/usr/bin/perl

# use strict;
# use warnings;
# use feature 'say';

# # Ensure there's at least one argument
# if (@ARGV < 2) {
#     die "Usage: $0 <matching_string> <word1> <word2> ...\n";
# }

# # The first argument is the matching string
# my $matching_string = shift @ARGV;

# # Iterate over the remaining arguments
# foreach my $word (@ARGV) {
#     # If the word contains the matching string, print it in uppercase
#     if ($word =~ /$matching_string/) {
#         print uc($word), " ";
#     } else {
#         print $word, " ";
#     }
# }

# print "\n";