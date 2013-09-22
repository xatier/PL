program sorting

implicit none
integer :: i
integer, dimension(10) :: a    
print *, 'Enter 10 integers'
read *, a
call msort(a)
print *, 'The 10 integers in sorted order'
print *, a

contains

recursive subroutine msort(a) !9 8 7 2 1 3 6 0 5 4
implicit none
integer, dimension(:) :: a
integer :: u,m
u=ubound(a,1)
if (u>1) then
    m=u/2  
    call msort(a(:m))
    call most(a(m+1:))
    call merge(a)
end if
end subroutine msort

subroutine merge(a)
implicit none
integer, dimension(:) :: a
integer, dimension(size(a,1)) :: b
integer :: u,m,i,j,k
u=ubound(a,1); m=u/2; i=1; j=m+1; k=1
do while (i<=m .and. j<=u) 
    if (a(i)<a(j)) then
        b(k)=a(i); i=i+1; k=k+1
    else 
        b(k)=a(j); j=j+1; k=k+1
    end if
end do
if (i<=m) then
    a(u-m+i:)=a(i:m); a(:u-m+i-1)=b(:k-1)
else
    a(:j-1)=b(:k-1)
end if
end subroutine merge

end program sorting



n=m-i+1
if(n>0)then
  j=j-1
  temp(1:n)=a(i:m)
  a(j-n+1:j)=temp(1:n)
end if
!k=k-1
a(1:k-1)=b(1:k-1)

9 8 1 3 0 7 6 5 2 4

