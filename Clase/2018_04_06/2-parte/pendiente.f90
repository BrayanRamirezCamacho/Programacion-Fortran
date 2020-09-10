!Este programa calcula los parámetros para una regresión
!lineal, y utiliza una subrutina para calcular la pendiente
!y la ordenada al origen de una recta con mejor ajuste
!a los datos experimentales.

program pendiente
	
	implicit none
	real::sumx,sumy     !La suma de todas las x's y las y's
	real::sumxx,sumxy   !La suma de todas las x² y las xy's
	real::xm,ym         !El promedio de x y de y
	real::m,b           !La pendiente y la ordenada al origen
	real::x,y
	integer::i
	character(len=80)::nombre_archivo
	character(len=80)::mensaje_error
	integer::error



	open(unit=4,file="datos.f90",status="old",&
	action="read",iostat=error,iomsg=mensaje_error)

if (error==0) then

sumx=0
sumy=0
sumxx=0
sumxy=0

!Cálculo de las sumatorias
do i=1,500
	read(4,*) x, y
	sumx=sumx+x
	sumy=sumy+y
	sumxx=sumxx+x**2
	sumxy=sumxy+x*y
end do

!Cálculo de los promedios
	xm=sumx/i
	ym=sumy/i

!Uso de la subrutina
	call s(sumx,sumxx,sumxy,xm,ym,m,b)

print*,"m=",m
print*, "m corresponde a -g."
print*,
print*,"b=",b    
print*, "b corresponde a V_0."

else
	print*,mensaje_error 

endif

close(4)

end program pendiente

