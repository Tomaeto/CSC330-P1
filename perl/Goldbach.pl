#!/usr/bin/perl
use strict;
use warnings;

for (my $i = 1; $i <= 100; $i++) {
	print $i;
	print "\n";
}

print "Please enter a positive integer: ";
my $input = <>;
for (my $i = 1; $i <= $input; $i++){
	print $i;
	print "\n";
}


