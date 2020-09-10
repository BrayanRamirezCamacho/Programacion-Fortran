!----------------------------------------------------------------------
!Este programa calcula la magnitud de vectores de velocidad y después
!imprime los resultados en pantalla. Estos vectores ya están dados
!y el usuario no puede cambiarlos.
!:)
!En el futuro podría ser modificado para calcular la magnitud de 
!cualquier vector.
!----------------------------------------------------------------------

program magnitudes

!----------------Declaración de variables------------------------------
implicit none
	
	real,dimension(3)::V1=[32,67,9]	!El arreglo para la velocidad 1
	real,dimension(3)::V2=[2,4,6]	!El arreglo para la velocidad 2
	real,dimension(3)::V3=[25,7,-1]	!El arreglo para la velocidad 3
	real::magV1,magV2,magV3		!Las magnitudes de las 						velocidades


!-----------------Cálculo de las magnitudes----------------------------

magV1=sqrt(V1(1)**2+V1(2)**2+V1(3)**2)
magV2=sqrt(V2(1)**2+V2(2)**2+V2(3)**2)
magV3=sqrt(V3(1)**2+V3(2)**2+V3(3)**2)


!------------------Resultados---------------------------------------
print*,"Las magnitudes de las velocidades son:"
print*,
print*,magV1, "km/h"
print*,"para el vector velocidad V1=(32,67,9) km/h,"
print*,
print*,magV2, "km/h"
print*,"para el vector velocidad V2=(2,4,6) km/h,"
print*,
print*,magV3, "km/h"
print*,"para el vector velocidad V3=(25,7,-1) km/h."



!------------------Fin del programa------------------------------------
end program magnitudes


