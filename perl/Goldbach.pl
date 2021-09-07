#!/usr/bin/perl
use strict;
use warnings;


print "Please enter a positive integer: ";
my $input = <>;
my $isPrime = 0;
for (my $i = 1; $i <= $input; $i++){
	$isPrime = isPrime($i);
	if ($isPrime == 0) {
		print $i;
		print "\n";		
	}
}

sub isPrime {
	my $num = shift;
	my $retVal = 0;
	for (my $i = 2; $i <= sqrt($num); $i++){
		if ($num % $i == 0) {
			$retVal = 1;
		}
	}
	return $retVal;
}
