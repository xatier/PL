#!/usr/bin/perl

use 5.012;

our %fib = ();

$fib{"fib(0)"} = 0;
$fib{"fib(1)"} = 1;
$fib{"fib(2)"} = 1;

sub f {
    my $n = shift;
    if ($n >= 0) {
        if (!defined $fib{"fib($n)"}) {
            $fib{"fib($n)"} = f($n-1) + f($n-2);
        }
        else {
            $fib{"fib($n)"}
        }
    }
}

print "Enter an integer >= 0: ";
while (chomp(my $n = <>)) {
    f($n);
    say "fib(" . $n . ") = " . $fib{"fib($n)"};
    say "Hash table created so far";
    while (my ($k, $v) = each %fib) {
        say "$k => $v";
    }
    print "Enter an integer >= 0: ";
}

