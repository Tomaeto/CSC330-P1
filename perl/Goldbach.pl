#!/usr/bin/perl
use strict;
use warnings;
#Program to compute Goldbach's Weak Conjecture for entered value
#For any odd int > 7, finds triplet of odd primes that sum to that int w/ smallest vector norm
#By Adrian Faircloth
#09-14-2021

sub isPrime {
	#Evaluates if a number is prime
	#0 = true, 1 = false
	my $num = shift;
	my $retVal = 0;
	for (my $i = 2; $i <= sqrt($num); $i++)
	{
		if ($num % $i == 0)
		{
			$retVal = 1;
		}
	}
	return $retVal;
}

sub findTriplet
{
	#Finds the triplet of primes that add to sum w/ smallest vector norm
	#Compares vector norm of triplets with last found smallest norm
	#Stores triplet w/ smaller norm each comparison
	#Finally, triplet w/ smallest vector norm is stored in @triplet
	my $sum = shift;
	my $currNorm = 0;
	my $smallestNorm = 0;
	my $i = 0;
	my $j = 0;
	my $k = 0;
	my @triplet;
	for ($i = $sum; $i > 2; $i--)
	{
		for ($j = 3; $j < $sum; $j++)
		{
			if (isPrime($i) == 0 && isPrime($j) == 0 )
			{
				$k = $sum - ($i + $j);
				if ($k != $i && $k != $j && $i != $j)
				{
					$currNorm = sqrt( ($i*$i) + ($j*$j) + ($k*$k));
					if ($smallestNorm == 0 || $currNorm < $smallestNorm)
					{
						$triplet[0] = $i;
						$triplet[1] = $j;
						$triplet[2] = $k;
						$smallestNorm = $currNorm;
					} 
				}
			}
		}
	}			
	return @triplet;
}
		
sub main
{
	#Gets user input, checks if input meets Goldbach Conjecture requirements
	#If yes, finds triplet that satisfies Conjecture w/ smallest vector norm,
	#	sorts triplet and prints result
	#If no, prints error message and exits
	print "Please enter an odd integer greater than seven: ";
	my $inpNum = int(<>);
	my $isprime = 0;
	my @triplet;
	if ($inpNum % 2 == 1 && $inpNum > 7)
	{
		@triplet = findTriplet($inpNum);
		@triplet = sort {$a <=> $b} @triplet;	
		print "$inpNum: ($triplet[0], $triplet[1], $triplet[2])\n"; 		
	}
	else
	{
		print "Invalid entry (not odd integer greater than seven)\n";
	}
		
}

#running driver code
main();
