package main
//Program to compute Goldbach's Weak Conjecture for input value
//For any odd int > 7, finds triplet of primes w/ smallest vector norm that sum to that value
//By Adrian Faircloth
//09-16-21
import "fmt"
import "math"
import "sort"
 
func isPrime(val int) (int) {
	var isPrime int;
	var i int;
	isPrime = 1;
	if (val == 2) {
		isPrime = 0;
	}
	for i = 2; i*i <= val; i++ {
		if (val % i == 0) {
			isPrime = 0;
		}
	}
	return isPrime;
}

func findTriplet(sum int) ([3]int) {
	//Finds triplet of primes < input whose vector norm is smallest
	//Compares the norm of each triplet found to current smallest norm
	//If current norm < smallest norm, fills triplet array with those values
	//Finally, triplet w/ smallest possible vector norm is stored in array and returned
	//In case of a tie, triplet w/ larger smallest value is returned
	var triplet [3] int;
	var tempTrip [3] int;
	var i int;
	var j int;
	var k int;
	var currNorm float64;
	var smallestNorm float64;
	for i = sum; i > 2; i-- {
		for j = 3; j < sum; j++ {
			if (isPrime(i) == 1 && isPrime(j) == 1) {
				k = sum - (i + j);
				if isPrime(k) == 1 && i != j && i != k && k!= j {
					currNorm = math.Sqrt(float64( (i*i) + (j*j) + (k*k) ));
					if smallestNorm == 0 || currNorm < smallestNorm {
						triplet[0] = i;
						triplet[1] = j;
						triplet[2] = k;
						smallestNorm = currNorm;
						sort.Ints(triplet[:]);
						
			   		} else if currNorm == smallestNorm {
						tempTrip[0] = i;
						tempTrip[1] = j;
						tempTrip[2] = k;
						sort.Ints(tempTrip[:]);
						if triplet[0] < tempTrip[0] {
							triplet = tempTrip;
						}
					}
				}
			} 			
		}  
	}
	return triplet;
}

func main() {
	//Takes user input inpVal and checks if inpVal meets Goldbach requirements
	//If yes, finds triplet w/ smallest norm that sums to inpVal,
	//	sorts triplet and prints
	//If no, prints error message and exits
	var inpVal int;
	fmt.Print("Enter an odd integer greater than seven: ");
	fmt.Scanln(&inpVal);
	var valTriplet [3] int;
	if (inpVal % 2 == 1 && inpVal > 7) {
		valTriplet = findTriplet(inpVal);
		fmt.Println(inpVal, ": (", valTriplet[0], ",", valTriplet[1], ",", valTriplet[2], ")");
	} else {
		fmt.Println("Invalid input (not odd integer greater than seven)");
	}
}
