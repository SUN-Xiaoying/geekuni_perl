#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

sub greet_friend {
    # Accept a hash reference
    my $rh_friend = {@_};  # Convert @_ (key-value pairs) into a hash reference

    # Dereference the hash reference into a hash
    my %friend = %$rh_friend;

    # Construct the greeting string
    my $greeting = "Hi $friend{name}! I'm " . ($friend{age} + 1) .
                   " and I read $friend{reading} ages ago. Totally boring."; 

    $greeting .= " But I like $friend{hobby} as a hobby" if defined $friend{hobby};
    
    $greeting .= " and $friend{diet} as a diet" if defined $friend{diet};

    return $greeting . ".";
}

# Call the subroutine with named parameters
say greet_friend(
    name    => 'Daniela',
    age     => 16,
    reading => 'Shakespeare',
    hobby   => 'Pac Man',
    diet    => 'Vegan',
    @_
);

# #!/usr/bin/perl

# use strict;
# use warnings;
# use Data::Dump 'pp';
# use feature 'say';

# sub greet_friend {
#     my %friend = (
#         age     => 5,
#         reading => 'Encyclopedia Britannica',
#         @_
#     );

#     return unless $friend{name};

#     my $response = "Hi $friend{name}! I'm ".
#         ($friend{age}+1).
#         " and I read $friend{reading} ages ago. Totally boring.";
#     delete $friend{age};
#     delete $friend{name};
#     delete $friend{reading};
#     return $response unless keys(%friend);

#     $response .= ' But I like ';
#     $response .= join(' and ',
#         map { $friend{$_}.' as a '.$_ } keys (%friend)).'.';
#     return $response;
# }

# say greet_friend(
#     name    => 'Dazza',
#     age     => 61,
#     reading => 'Shake Milk',
#     hobby   => 'Panda'
# );