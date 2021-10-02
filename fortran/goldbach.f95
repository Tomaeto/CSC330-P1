!Program to compute Goldbach's Weak Conjecture for entered value
!For any odd int > 7, find triplet of odd primes w/ smallest vector norm that
!       sum to that value
!By Adrian Faircloth
!10-1-21
program Goldbach

!Getting int input from user, checks if input meets Goldbach reqs
!if yes, finds triplet that satisfies Goldbach Conjecture,
!       prints result
!if no, prints error message and exits
        integer :: inpVal, i, j, k
        integer, dimension(3) :: triplet
        logical :: isPrime
        print *, "Enter an odd integer greater than seven: "
        read *, inpVal
        if (inpVal .gt. 7 .and. mod(inpVal, 2) .ne. 0) then
               call findTriplet(inpVal, triplet)
               write (*, fmt = "(i0, a)", advance = "no") inpVal, ": ("      
               write (*, fmt = "(i0, a)", advance = "no") triplet(1), ", "
               write (*, fmt = "(i0, a)", advance = "no") triplet(2), ", "
               write (*, fmt = "(i0, a)", advance = "yes") triplet(3), ")"     
        else
                print *, "Invalid entry (not odd integer greater than seven)"
        endif
        
end program

subroutine findTriplet(sumval, triplet)
!Finds triplets of primes < sumval that sum to sumval
!If a triplet's vector norm < current smallest norm,
!       sets triplet array to those values
!Finally, triplet w/ smallest norm stored in triplet array
!In case of a tie, triplet/ larger smallest value is returned
        integer :: sumval
        integer, dimension(3) :: triplet
        integer, dimension(3) :: tempTrip
        real :: currNorm, smallNorm
        logical :: isPrime
        smallNorm = 0
        do i = 1, sumval, 1
              do j = 1, sumval, 1  
                 if (isPrime(i) .and. isPrime(j)) then
                       k = abs(sumval - i - j)
                       if (isPrime(k) .and. k .ne. j .and. k .ne. i .and. i .ne. j) then
                            currNorm = real( i**2 + j**2 + k**2)
                            currNorm = sqrt(currNorm) 
                            if (smallNorm == 0 .or. currNorm < smallNorm) then
                                smallNorm = currNorm
                                triplet(1) = i
                                triplet(2) = j
                                triplet(3) = k
                                call sortTriplet(triplet)

                            else if (smallNorm == currNorm) then
                                tempTrip(1) = i
                                tempTrip(2) = j
                                tempTrip(3) = k
                                call sortTriplet(tempTrip)
                                if (tempTrip(1) .gt. triplet(1)) then
                                        triplet = tempTrip
                                endif
                            endif
                       endif
                 endif
              end do  
        end do
end subroutine

subroutine sortTriplet(triplet)
!subroutine to sort a triplet in ascending order
        integer, dimension(3) :: triplet
        if (triplet(1) .gt. triplet(3)) then
                call swap(triplet(1), triplet(3))
        endif
        if (triplet(1) .gt. triplet(2)) then
                call swap(triplet(1), triplet(2))
        endif
        if (triplet(2) .gt. triplet(3)) then
                call swap(triplet(2), triplet(3))
        endif
end subroutine

subroutine swap(a, b)
!Swaps the values of two integer variables
!Used in sortTriplet subroutine
        integer :: a, b, temp
        temp = a
        a = b
        b = temp
end subroutine

logical function isPrime(val)
!Function to check if a value is odd prime
!If yes, returns true
!If no, returns false
        integer :: val, c1, root
        isPrime = .true.
        root = int(sqrt(real(val)))
        !If value is 2, return false
        !Ensures only odd primes result in true
        if (val .eq. 2) then
                isPrime = .false.
        endif

        do c1 = 2, root
                if(mod(val, c1) .eq. 0) then
                        isPrime = .false.
                endif
        end do
end function isPrime

