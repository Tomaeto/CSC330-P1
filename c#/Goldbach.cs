using System;
using System.Collections.Generic;
//Program to compute Goldbach's Weak Conjecture for input value
//For any odd int > 7, find triplet of odd primes w/ smallest vector norm that sum to that value
//By Adrian Faircloth
//09-23-2021
public class Goldbach
{
	static public void Main()
	{
		//Getting int inputVal from user, checks if it meets Goldbach requirements
		//If yes, finds all primes < inputVal and finds triplet that satisfies Goldbach Conjecture
		//If no, prints error message and exits 
		int inputVal;
		Console.Write("Enter an odd integer greater than seven: ");
		String str = Console.ReadLine();
		inputVal = Convert.ToInt32(str);
		if (inputVal % 2 == 1 && inputVal > 7)
		{
			List<int> primes = new List<int>();
			findOddPrimes(inputVal, ref primes);
			int[] triplet = new int[3];
			findTriplet(inputVal, ref triplet, primes);
			Array.Sort(triplet);
			Console.WriteLine($"{inputVal}: ({triplet[0]}, {triplet[1]}, {triplet[2]})");
		}
		else
			Console.WriteLine("Invalid entry (not integer greater than seven)");
		
	}

	private static void findOddPrimes(int val, ref List<int> primes)
	{
		//Finds all odd primes < val 
		//List of primes passed in by reference
		bool isPrime;
		for (int i = 1; i < val; i++)
		{
			isPrime = true;
			for (int j = 2; j*j <= i; j++)
			{
				if (i % j == 0)
				{
					isPrime = false;
				}
			}
			if (isPrime == true)
				primes.Add(i);
		}	
		primes.Remove(2);	//Removing 2 from set of primes to keep only odd primes
	}

	private static void findTriplet(int sum, ref int[] triplet, List<int> primes)
	{
		//Finds triplet of odd primes that sum to sum and have smallest vector norm
		//Finds first triplet, then compares the norm of each triplet found w/ smallest vector yet found
		//Finally, triplet with smallest vector norm will be stored in triplet array
		double smallestNorm = 0;
		double currNorm;
		int i;
		int j;
		int k;
		for (i = sum; i > 1; i--)
		{
			for (j = 1; j < sum; j++)
			{
				if (primes.Contains(i) == true && primes.Contains(j) == true)
				{
					k = sum - (i + j);
					if (k != j  && k != i && i != j)
					{
						currNorm = Math.Sqrt( (i*i) + (j*j) + (k*k) );
						if (smallestNorm == 0 || currNorm < smallestNorm)
						{
							triplet[0] = i;
							triplet[1] = j;
							triplet[2] = k;
							smallestNorm = currNorm;
						}
					}
				}
			}
		}
	}
}
