sub fib
{
    my $n=shift;
    $h{"fib($n)"}=$n<=1? $n: fib($n-1)+fib($n-2), if !exists $h{"$n!"};
    return $h{"fib($n)"};
}

while (print("Enter an integer>=0: "),$n=<>) {
    chomp $n;
    print "fib($n) = ",fib($n),"\n";
    print "Hash table created so far\n";
    foreach (keys %h) { print "$_ => $h{$_}\n";  }
    print("\n");
}
