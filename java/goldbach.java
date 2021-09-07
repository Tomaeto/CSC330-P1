
import java.util.Scanner;
public class goldbach {

	public static void main(String[] args) {
	int val;
	boolean meetsReqs;
	Scanner in = new Scanner(System.in);
	System.out.print("Enter an odd integer greater than seven: ");
	val = in.nextInt();
	meetsReqs = checkReqs(val);
	int[] primes = findOddPrimes(val);
	}
	
	public static boolean checkReqs(int n) { 
	//Checks if a value satisfies the requirements for Goldbach's weak conjecture (odd int > 7)
		if(n % 2 == 1 && n > 7)
		{ 
			return true;
		}
		else
			return false;
	}
	
	public static int[] findOddPrimes(int n) {
	//Creates boolean array isPrime[] of all values < n
	//Any value in isPrime that is not an odd  prime is set to false
		boolean isPrime[] = new boolean[n];
		for (int i = 1; i < n; i++)
			isPrime[i] = true;

		for (int i = 2; i*i < n; i++) {
			if (isPrime[i] == true) {
				for (int j = i*i; j < n; j += i)
					isPrime[j] = false;
			}
		}
		isPrime[2] = false;	//Removing 2 from set of primes	
		
	//Counting number of odd primes in range < n
	//and storing in an int array
		int numPrimes = 0;
		for (int i = 0; i < n; i++) {
			if (isPrime[i] == true)
				numPrimes++;
		}
		int[] primeVals = new int[numPrimes];
		int pointer = 0;
		for (int i = 0; i < n; i++) {
			if (isPrime[i] == true) {
				primeVals[pointer] = i;
				pointer++;
			}
		}
		return primeVals;
	}
	
}
