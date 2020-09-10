SUBROUTINE comb_sort(n,X)

implicit none
integer,intent(in)::n
integer:: gap, i, j
real:: aux
real,dimension(n),intent(inout)::X

gap=n-1

DO_PRINCIPAL: DO WHILE (gap>0) !realizar loop hasta que gap=0

do i=1,n
  do j=i+gap,n,n
   if (X(i)>X(j)) then
    aux= x(i)
    x(i)=x(j)
    x(j)=aux
   end if
  end do
end do
gap=gap/1.3

END DO DO_PRINCIPAL

END SUBROUTINE comb_sort
