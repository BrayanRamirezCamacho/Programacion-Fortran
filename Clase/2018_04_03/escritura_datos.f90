subroutine escritura_datos(a0,n0,h0)

	implicit none

		real,intent(in)::a0,h0
		integer,intent(in)::n0
		integer::i 
		real::x,y
		real,external::f 

	do i=0,n0

		x=a0+i*h0
		y=f(x)
		write(3,*)x,y
	end do

end subroutine