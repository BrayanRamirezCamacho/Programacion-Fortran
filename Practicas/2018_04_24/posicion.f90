!-------------------------------------------------------------------
!Esta subrutina escribe en un archivo de texto, cuatro columnas de 
!datos: el tiempo transcurrido y las posiciones en x,y,z.
!.
!La velocidad está dada en km/h, las posiciones en km y el tiempo en h.
!-------------------------------------------------------------------

program posicion

!---------------------Declaración de variables----------------------
implicit none

	real,parameter::h=0.5		!El intervalo de tiempo
	real,dimension(48,3)::X		!Arreglo para las 						posiciones	
	real,dimension(3)::V=[32,67,9]	!Arreglo de la velocidad
	integer::error			!No. de errores
	character(len=80)::m_error	!Mensaje de error
	integer::i,j			!Los índices

!-------------------------------------------------------------------

!--------------------Mensaje hacia el usuario-----------------------
print*, "Este programa generará un archivo de texto con los datos de"
print*, "tiempo, y las posiciones en X, en Y y en Z, de un cuerpo"
print*, "que se mueve con velocidad constante, partiendo desde"
print*, "el origen de cierto sistema de coordenadas cartesianas."
print*,
print*, "El archivo 'A1.dat' ha sido generado. Disfrútelo."

open (unit=1, file="A1.dat", status="new", action="write", &
	iostat=error, iomsg=m_error )


!------------------Si no existen errores:---------------------------
if ( error == 0 ) then

do i=1,48
	do j=1,3
		X(i,j)=(h*i)*V(j)
	end do

		write(1,*)i*h,X(i,1),X(i,2),X(i,3)
 
end do 

!----------------En caso de existir algun error--------------------
else
	print*, m_error
	stop

end if

!--------------------------------------------------------------------

 close(1)

!------------------Fin del programa---------------------------------
end program posicion
