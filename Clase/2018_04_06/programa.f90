!-----------------------------------------------------
!Este programa evalua una función de dos variables,
!utiliza una subrutina y una función de fortran.
!-----------------------------------------------------

program programa

!Declaración de variables
	implicit none

	real::a,b     !Intervalo en x
	real::c,d     !Intervalo en y
	integer::m,n  !Número de particiones de los intervalos
	real::h_x,h_y !La longitud de las particiones 
	character(len=80)::nombre_archivo
	character(len=80)::mensaje_error
	integer::error


	print*,"Introduzca el intervalo a recorrer en x,"
	print*, "escríbalo como a,b"
	read*,a
	read*,b

	print*,"Introduzca el número de particiones del intervalo en x"
	read*,n

	print*,"Introduzca el intervalo a recorrer en y,"
	print*, "escríbalo como c,d"
	read*,c
	read*,d

	print*,"Introduzca el número de particiones del intervalo en y"
	read*,m 


	print*,"Escriba el nombre del archivo"
	read*,nombre_archivo


!Cálculo de los subintervalos
h_x=(b-a)/m

h_y=(d-c)/n


open(unit=1,file=nombre_archivo,status="unknown",&
	action="write",iostat=error,iomsg=mensaje_error)

	if ( error == 0 ) then
		call subrutina(n,m,a,c,h_x,h_y)

	else
		print*,mensaje_error

	endif

close(1)

end program programa