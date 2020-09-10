subroutine mtrxprod(A,B,C,m,n,k,l)

	!Declaración de variables
	implicit none

	real,intent(in),dimension(1:l,1:n)::A
	real,intent(in),dimension(1:m,1:t)::B
	real,dimension(1:l,1:t)::C
	integer,intent(in)::l,m,n,t
	integer::i,j,k


!Aquí se realiza el producto de matrices
	do i=1,l
		do j=1,t 
			C(i,j)=0
			do k=1,n 
				C(i,j)=C(i,j)+A(i,k)*B(k,j)
			end do 
		end do 
	end do

!Aquí se imprime la matriz resultante, C
print*,"La matriz resultante del producto es:"

do i=1.l
	print*,(C(i,j),J=1,t)
end do

end subroutine mtrxprod