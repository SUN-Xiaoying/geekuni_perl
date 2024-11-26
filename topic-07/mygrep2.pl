# #!/usr/bin/perl

# use strict;
# use warnings;
# use feature 'say';

# my $key = $ARGV[0];
# my $filename = $ARGV[1];

# open(my $fh, '<', $filename);
# while(my $line = <$fh>){
#     chomp($line); ??
#     if ($line =~ /\Q$key\E/i) {   # Use \Q...\E to escape special characters in $key
#         $line =~ s/($key)/uc($1)/ieg;  # Convert matches of $key to uppercase
#         say $line;             # Print the modified line
#     }
# }

# close($fh);


#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

my $str = $ARGV[0];
my $ucstr = uc($str);
my $filename = $ARGV[1];

open(my $fh, '<', $filename);
while (my $line = <$fh>) {
    next unless $line =~ m/$str/;

    $line =~ s/$str/$ucstr/g;
    print $line;
}
close $fh;