#include <math.h>
#include <stdio.h>
//Program to compute Goldbach's Weak Conjecture for input value
//For any odd int > 7, find triplet of odd primes w/ smallest vector norm that sum to that int
//By Adrian Faircloth
//09-26-21
int isPrime(int);
void findTriplet(int*, int);
void sortTriplet(int*);
void swap(int*, int*);

int main()
{
	//Getting int input from user, checks if input meets Goldbach requirements
	//If yes, finds triplet that satisfies Goldbach Conjecture,
	//	sorts triplet and prints result
	//If no, prints error message and exits
	int input;
	printf("Enter an odd integer greater than seven: ");
	scanf("%d", &input);
	if (input % 2 != 0 && input > 7)
	{
		int triplet[3];
		int* triPtr = triplet;
		findTriplet(triPtr, input);
		int j = 3;
		int i = 9;
		sortTriplet(triPtr);
		printf("%d: (%d, %d, %d)\n", input, triplet[0], triplet[1], triplet[2]);
	}
	else
		printf("Invalid entry (not odd integer greater than seven)\n");
	return 0;
}

int isPrime(int val)
{
	//Checks if value is prime
	//If yes, returns 1
	//If no or val = 2, returns 0
	int j, isPrime;
	isPrime = 1;
	//Returns 0 if val = 2
	//Prevents 2 from being input into array of primes
	if (val == 2)
		isPrime = 0;
	for (j = 2; j*j <= val; j++)
	{
		if (val % j == 0)
		{
			isPrime = 0;
		}
	}
	return isPrime;
}



void findTriplet(int* arrPtr, int sum)
{
	//Finds triplets of primes < sum that sum to input value
	//If a triplet's vector norm < current smallest norm, sets triplet array to those values
	//Finally, triplet w/ smallest vector norm is stored in triplet array
	int i, j, k;
	double smallestNorm = 0;
	double currNorm = 0;
	for (i = sum; i > 1; i--)
	{
		for (j = 1; j < sum; j++)
		{
			if (isPrime(i) == 1 && isPrime(j) == 1)
			{
				k = sum - (i + j);
				if (k != j && k != i && i != j)
				{
					currNorm = sqrt((i*i) + (j*j) + (k*k));
					if (smallestNorm == 0 || currNorm < smallestNorm)
					{
						smallestNorm = currNorm;
						*(arrPtr) = i;
						*(arrPtr + 1) = j;
						*(arrPtr + 2) = k;
					}
				}
			}
		}
	}	
}

void sortTriplet(int* arrPtr)
{
	//Sorts triplet array in ascending order (i, j, k)
	int i = *arrPtr;
	int j = *(arrPtr + 1);
	int k = *(arrPtr + 2);
	if (i > k)
		swap(&i, &k);
	if (i > j)
		swap(&i, &j);
	if (j > k)
		swap(&j, &k);	
	*arrPtr = i;
	*(arrPtr + 1) = j;
	*(arrPtr + 2) = k;
}

void swap(int *a, int *b)
{
	//Swaps two values using pointers
	//Used to sort triplet array
	int temp = *a;
	*a = *b;
	*b = temp;
}
