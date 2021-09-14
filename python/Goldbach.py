#!/usr/bin/python3

#Program for computing Goldbach's Weak Conjecture for an entered value
#By Adrian Faircloth
#9-12-2021
import math

def checkReqs(val):
	#Checks if input value meets requirements for Goldbach Conjecture
	if (int(val) % 2 == 1 and int(val) > 7):
		return 1
	else:
		return 0

def findOddPrimes(val):
	#Creates boolean list isPrime of size val and sets all indexes that are not prime
	#to False
	isPrime = [True for i in range(0, int(val))]
	step = 2
	while(step * step <= int(val)):

		if(isPrime[step] == True):

			for i in range(step * step, int(val), step):
				isPrime[i] = False
		step += 1

	#Creating list of prime values based on isPrime indexes set to True
	primes = []
	for i in range(0, len(isPrime)):

		if isPrime[i] == True:
			primes.append(i)
	return primes
		
	

def findTriplet(valSum, valRange):
	#Finding triplet of unique odd primes that sum to valSum
	#and has smallest vector norm
	#Compares norm of each triplet found, stores triplet w/ smaller norm
	#Finally, triplet[] will contain values w/ smallest vector norm 
	smallestNorm = float()
	currNorm = float()
	i = 0
	j = 0
	k = 0
	triplet = [0, 0, 0]

	for i in range(int(valSum), 2, -1):

		for j in range(3, int(valSum), 1):

			if (i in valRange and j in valRange):

				k = int(valSum) - (i + j)
				if (k != j and j != i and k != i):

					currNorm = math.sqrt((i*i) + (j*j) + (k*k))					
					if (smallestNorm == float(0) or currNorm < smallestNorm):

						triplet[0] = i
						triplet[1] = j
						triplet[2] = k
						smallestNorm = currNorm
	return triplet

def main():
	#Taking input value, checks if input meets Goldbach requirements
	#If yes, finds triplet of odd primes w/ smallest vector norm that sum to input
	#If no, prints error message and exits
	inputVal = 0
	inputVal = input("Enter an odd integer greater than seven: ")
	meetsReqs = checkReqs(inputVal)
	if meetsReqs == 1:
		primeSet = findOddPrimes(inputVal)
		valTriplet = findTriplet(inputVal, primeSet)
		valTriplet.sort()
		print(inputVal + ": (" + str(valTriplet[0]) + ", " + str(valTriplet[1]) + ", " + str(valTriplet[2]) + ")")
	else:
		print("Invalid entry (Not odd integer greater than seven)")

#Running main driver code
main()
