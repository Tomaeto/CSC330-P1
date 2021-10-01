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
        integer :: sumval
        integer, dimension(3) :: triplet
        real :: currNorm, smallNorm
        logical :: isPrime
        smallNorm = 0
        do i = 1, sumval
              do j = 1, sumval  
                 if (isPrime(i) .and. isPrime(j)) then
                       k = abs(sumval - i - j)
                       if (k .ne. j .and. k .ne. i .and. i .ne. j) then
                            currNorm = sqrt(real(i*i + j*j + k*k)) 
                            if (smallNorm .eq. 0 .or. currNorm .lt. smallNorm) then
                                smallNorm = currNorm
                                triplet(1) = i
                                triplet(2) = j
                                triplet(3) = k
                            endif
                       endif
                 endif
              end do  
        end do
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

