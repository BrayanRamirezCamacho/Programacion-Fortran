!------------------------------------------------------
!Esta subrutina evalua una funcion de dos variables
!y escribe en un documento externo estos valores.
!------------------------------------------------------

subroutine subrutina(n,m,a,c,h_x,h_y)
    implicit none

    integer::i,j
    real,external::funcion
    integer,intent(in)::n,m 
    real,intent(in)::a,c
    real,intent(in)::h_x,h_y
    real::x,y

do i=1,n
	x=a+h_x*i

		do j=1,m 
			y=c+h_y*j

		write(1,*)x,y,funcion(x,y)

		end do

end do


end subroutine subrutina