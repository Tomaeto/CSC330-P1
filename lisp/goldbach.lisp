#!/usr/bin/sbcl --script
;;Program to compute Goldbach's Weak Conjecture for input value
;;For any odd int > 7, finds triplet of odd primes w/ smallest vector norm that sum to that value
;;By Adrian Faircloth
;;10-1-21
;;
(defun isPrime (val)
;;Function to check if a value is an odd prime
;;If yes, returns 1
;;If no, returns 0
        (let ( (isprime 1) (root 0)) 
	(setq root (sqrt val))
	;;If value is 2, set to 0
	;;Removes 2 from possible sets of primes
        (if (= val 2)
         (setq isprime 0)
	)
	(loop for i from 2 to root
		if (= (mod val i) 0)
			do (setq isprime 0)
		
	)
        
	(return-from isPrime isprime)
        )
)


;;Main driver code
;;
;;Takes input from user for int value, checks if input meets Goldbach reqs
;;If yes, finds triplet of odd primes and prints result
;;If no, prints error message and exits
(write-string "Enter an odd integer greater than seven: ")
(finish-output)
(defvar inpVal)

(setq inpVal (read))
(clear-input)
(defvar i)
(defvar j)
(defvar k)
(defvar currNorm)
(defvar smallNorm)
;;Checking if input meets Goldbach requirements
(cond ((and (> inpVal 7) (/= (mod inpVal 2) 0))
	(defvar triplet)
	(setf triplet (make-array '(3)))
	(setf i 1)
	(setf j 1)
	(setq smallNorm 0)
	(setq currNorm 0)
	;;Loops through all possible triples that sum to input
	;;For each triplet, compares vector norm to current smallest norm
	;;If current norm < smallest norm, triplet is set to those primes
	;;Finally, triplet with smallest vector norm is in triplet array
	(loop for i from 1 to inpVal doing
		(loop for j from 1 to inpVal doing
		(if (and (= (isPrime i) 1) (= (isPrime j) 1))
			(progn
			(setq k (- inpVal (+ i j)))
			(setq k (abs k))
			(if (and (/= k i) (/= k j) (/= i j))
				(progn
				(setq currNorm (sqrt  (+ (+ (* i i) (* j j)) (* k k) )))
				(if (or (< currNorm smallNorm) (= smallNorm 0))
					(progn	
					(setf (aref triplet 0) i)
					(setf (aref triplet 1) j)
					(setf (aref triplet 2) k)
					(setq smallNorm currNorm)
					)
				)
				)
			)
			)
		)
		)	
	
	)
	;;Printing results
	(write inpVal)
	(princ ": (")
	(write (aref triplet 0))
	(princ ", ")
	(write (aref triplet 1))
	(princ ", ")
	(write (aref triplet 2))
	(princ ")")
	(terpri)
      )
      ((or (<= inpVal 7) (= (mod inpVal 2) 0))
		(write-line "Invalid entry (not odd integer greater than seven)"))
)

	
	
