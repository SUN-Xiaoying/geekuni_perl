#!/usr/bin/perl

# use strict;
# use warnings;
# use feature 'say';
# use Data::Dump qw(pp);

# my $r_sub1 = sub { return "Foo"; };
# my $r_sub2 = sub { return { that => 2, this => 1 }; };

# sub is_all_caps {
#     my ($r_sub) = @_;

#     my $retval = $r_sub->();
#      if (ref($retval) eq 'HASH') {
#         return pp($r_sub2->());
#     } elsif (uc($retval) eq $retval) {
#         return 'returns an all upper case string';
#     } else {
#         return 'returns a string with lower case';
#     }
# }

# say 'r_sub1 '.is_all_caps($r_sub1);
# say 'r_sub2 '.is_all_caps($r_sub2);

#!/usr/bin/perl

use strict;
use warnings;
use Data::Dump 'pp';
use feature 'say';

my $r_foo = sub { return "foo"; };
my $r_bar = sub { return {this => 1, that => 2}; };

sub call_sub {

    ### Insert code here ###
    # $retval is what the subroutine returns
    my $r_sub = shift;
    my $retval = $r_sub->();

    return $retval;
}

say 'r_foo returns '.pp(call_sub($r_foo));
say 'r_bar returns '.pp(call_sub($r_bar));

