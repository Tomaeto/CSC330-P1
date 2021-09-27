package main
//Program to compute Goldbach's Weak Conjecture for input value
//For any odd int > 7, finds triplet of primes w/ smallest vector norm that sum to that value
//By Adrian Faircloth
//09-16-21
import "fmt"
import "math"
import "sort"
func findPrimes(val int) ([]int) {
	//Finds all odd primes < input value
	//Returns array of found primes
	var primes []int;
	var i int;
	var j int;
	var isPrime bool;
	for i = 1; i < val; i++ {
		isPrime = true;
		for j = 2; j * j < val; j++ {
			if (i % j == 0) {
				isPrime = false;	
			}
		}
		if isPrime == true {
			primes = append(primes, i);
		}	
	}
	return primes;
} 

func inSet(val int, set []int) (int) {
	//Checks if an int is in an array of ints
	//Used to check if a value is in the set of primes < input value
	for i, item := range set {
		if item == val {
			return i;
		}
	}
	return -1;
}

func findTriplet(sum int, set *[]int) ([3]int) {
	//Finds triplet of primes < input whose vector norm is smallest
	//Compares the norm of each triplet found to current smallest norm
	//If current norm < smallest norm, fills triplet array with those values
	//Finally, triplet w/ smallest possible vector norm is stored in array and returned
	var triplet [3] int;
	var i int;
	var j int;
	var k int;
	var currNorm float64;
	var smallestNorm float64;
	for i = sum; i > 2; i-- {
		for j = 3; j < sum; j++ {
			if inSet(i, *set) != -1 && inSet(j, *set) != -1 {
				k = sum - (i + j);
				if i != j && i != k && k!= j {
					currNorm = math.Sqrt(float64( (i*i) + (j*j) + (k*k) ));
					if smallestNorm == 0 || currNorm < smallestNorm {
						triplet[0] = i;
						triplet[1] = j;
						triplet[2] = k;
						smallestNorm = currNorm;
					}	
				}
			} 			
		}  
	}
	return triplet;
}

func main() {
	//Takes user input inpVal and checks if inpVal meets Goldbach requirements
	//If yes, finds primes < inpVal, finds triplet w/ smallest norm that sums to inpVal,
	//	sorts triplet and prints
	//If no, prints error message and exits
	var inpVal int;
	fmt.Print("Enter an odd integer greater than seven: ");
	fmt.Scanln(&inpVal);
	var primeSet []int;
	var valTriplet [3] int;
	var ptr *[]int;
	if (inpVal % 2 == 1 && inpVal > 7) {
		primeSet = findPrimes(inpVal);
		ptr = &primeSet;
		valTriplet = findTriplet(inpVal, ptr);
		sort.Ints(valTriplet[:]);
		fmt.Println(inpVal, ": (", valTriplet[0], ",", valTriplet[1], ",", valTriplet[2], ")");
	} else {
		fmt.Println("Invalid input (not odd integer greater than seven)");
	}
}
