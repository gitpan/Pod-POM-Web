use strict;
use warnings;
no warnings 'uninitialized';

my $id_regex = qr/(?![0-9])       # don't start with a digit
                  \w\w+           # start with 2 or more word chars ..
                  (?:::\w+)*      # .. and  possibly ::some::more::components
                 /x; 

my $wregex   = qr/(?:                  # either a Perl variable:
                    (?:\$\#?|\@|\%)    #   initial sigil
                    (?:                #     followed by
                       $id_regex       #       an id
                       |               #     or
                       \^\w            #       builtin var with '^' prefix
                       |               #     or
                       (?:[\#\$](?!\w))#       just '$$' or '$#'
                       |               #     or
                       [^{\w\s\$]      #       builtin vars with 1 special char
                     )
                     |                 # or
                     $id_regex         # a plain word or module name
                 )/x;


print $wregex;
