#!/usr/bin/perl

use 5.012;

print "Enter integers in a line: ";
my @a = split /\s+/, <>;
bsort(\@a);
say "after sorting: ", join " ", @a;

sub bsort {
    my $a_ref = shift;
    for my $i (0 .. $#$a_ref) {
        for my $j ($i+1 .. $#$a_ref) {
                ($a_ref->[$i], $a_ref->[$j]) = ( $a_ref->[$j], $a_ref->[$i]) if ($a_ref->[$i] > $a_ref->[$j]);
        }
    }
}
