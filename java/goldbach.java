//Program for computing Goldbach's Weak Conjecture for an entered value
//For any odd integer greater than seven, finds triplet of odd primes that sums to that integer
//By Adrian Faircloth
//9-9-2021
import java.util.Scanner;
import java.util.Arrays;
public class goldbach {
	
private static int[] primes;	
private static int[] triplet = new int[3];
	public static void main(String[] args) 
	{
	//Takes user input, checks if input meets Goldbach requirements
	//If yes, finds triplet of primes w/ smallest vector norm whose sum is input value,
	//	sorts triplet and prints
	//If no, prints error message and exits
		int inputVal;
		boolean meetsReqs;
		Scanner in = new Scanner(System.in);
		System.out.print("Enter an odd integer greater than seven: ");
		inputVal = in.nextInt();
		meetsReqs = checkReqs(inputVal);
		if (meetsReqs == true)
		{
			primes = findOddPrimes(inputVal);
			findTriplet(inputVal);
			System.out.println(inputVal + ": (" + triplet[0] + ", " + triplet[1] + ", " + triplet[2] + ")"); 
		}
		else
		{
			System.out.println("Invalid input (not odd integer greater than seven)");	
		}
	}	

	public static boolean checkReqs(int val) 
	{ 
	//Checks if a value satisfies the requirements for Goldbach's weak conjecture (odd int > 7)
		if(val % 2 == 1 && val > 7)
		{ 
			return true;
		}
		else
			return false;
	}
	
	public static int[] findOddPrimes(int n) 
	{
	//Creates boolean array isPrime[] of all values < n
	//Any value in isPrime that is not an odd  prime is set to false
		boolean isPrime[] = new boolean[n];
		for (int i = 1; i < n; i++)
			isPrime[i] = true;

		for (int i = 2; i*i <= n; i++) 
		{
			if (isPrime[i] == true) 
			{
				for (int j = i*i; j < n; j += i)
					isPrime[j] = false;
			}
		}
		isPrime[2] = false;	//Removing 2 from set of primes	
		
	//Counting number of odd primes in range < n
	//and storing in an int array
		int numPrimes = 0;
		for (int i = 0; i < n; i++) 
		{
			if (isPrime[i] == true)
				numPrimes++;
		}
		int[] primeVals = new int[numPrimes];
		int pointer = 0;
		for (int i = 0; i < n; i++) 
		{
			if (isPrime[i] == true) 
			{
				primeVals[pointer] = i;
				pointer++;
			}
		}
		return primeVals;
	}
	
	public static boolean isPrime(int val) 
	{
	//Checks if a value is in the set of primes < n
		for (int i = 2; i <= Math.sqrt(val); i++)
		{
			if (val % i == 0)
				return false;
		}
		return true;
	}
	
	public static void findTriplet(int sum) 
	{
	//Finds the triplet of unique odd primes that sum to an entered value
	//and has the smallest vector norm
	//Compares the norms of each possible triplet of primes, stores triplet w/ smaller norm each comparison
	//Finally, triplet will contain values with smallest vector norm
	//In the case of a tie, the triplet with the larger smallest value is returned
		double smallestNorm = 0;	
		double currNorm = 0;
		int k = 0;
		int i = 0;
		int j = 0;
		int[] tempTrip = new int[3];
		for (i = 1; i < sum; i++)
		{
			for (j = 1; j < sum ; j++)
			{
				if(isPrime(i) == true && isPrime(j) == true)
				{
					k = sum - (j + i);
					if  (isPrime(k) && k != j && k != i && j != i)
					{
						currNorm = Math.sqrt((i*i) + (j*j) + (k*k));
						if (smallestNorm == 0 || currNorm < smallestNorm)
						{
							triplet[0] = i;
							triplet[1] = j;
							triplet[2] = k;
							smallestNorm = currNorm;
							Arrays.sort(triplet);
        
						}	
						else if (smallestNorm == currNorm)
						{
							tempTrip[0] = i;
							tempTrip[1] = j;
							tempTrip[2] = k;
							Arrays.sort(tempTrip);
							if (triplet[0] < tempTrip[0])
								triplet = tempTrip;
							

						}
					}		
				}
			}
		}	
	}
}	
