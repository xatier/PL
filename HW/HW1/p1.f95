program sorting
 

    implicit none
    integer, dimension (10) :: arr
    print *, "Enter 10 intergers"
    read *, arr
    call msort(arr)
    print *, "The 10 integers in sorted order", arr

    !!!!!!!!!!!!!!!!!!!!!!!!!!
    ! merge sort
    !!!!!!!!!!!!!!!!!!!!!!!!!!
    contains
    subroutine merge(a)
        implicit none
        integer , dimension (:) :: a
        integer , dimension (lbound(a, 1) : ubound(a, 1)) :: t
        integer :: N, f, b, m, p, i, j

        f = ubound(a, 1)
        b = lbound(a, 1)
        N = f - b + 1
        m = (f+b) / 2
        i = b
        j = m + 1
        p = b


        do while (i <= m .and. j <= f)
            if (a(i) <= a(j)) then
                t(p) = a(i)
                i  = i + 1
            else
                t(p) = a(j)
                j = j + 1
            endif
            p = p + 1
        enddo

        do while (i <= m)
            t(p) = a(i)
            i = i + 1
            p = p + 1
        enddo

        do while (j <= f)
            t(p) = a(j)
            j = j + 1
            p = p + 1
        enddo

        p = b
        do while (p <= f)
            a(p) = t(p)
            p = p+1
        enddo

    end subroutine merge

    recursive subroutine msort (a)
        integer, dimension(:) :: a
        integer :: N, b, f ,m, tmp

        f = ubound(a, 1)
        b = lbound(a, 1)
        N = f - b + 1
        m = (f+b) / 2

        if (N < 2) then
            return
        endif

        if (N == 2 .and. a(b) < a(b)) then
            tmp = a(b)
            a(b) = a(f)
            a(f) = tmp
            return
        endif

        call msort(a(b:m))
        call msort(a(m+1:f))
        call merge(a)

    end subroutine msort
end program sorting

