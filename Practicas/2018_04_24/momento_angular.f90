!--------------------------------------------------------------------
!Este programa sirve para
!--------------------------------------------------------------------

program momento_angular


!------------Declaración de variables--------------------------------
implicit none
	real,parameter::m=1		!La masa del cuerpo en 						estudio, en kg
	real,dimension(3)::P		!El vector de momento lineal
	real,dimension(3)::X		!El vector de posicion
	real,dimension(3)::L1,L2,L3	!Los vectores de momento 						angular para las velocidades 						1,2 y 3, respectivamente
	real,dimension(3)::V1=[32,67,9]	!El vector de velocidad 1
	real,dimension(3)::V2=[2,4,6]	!El vector de velocidad 2
	real,dimension(3)::V3=[25,7,-1]	!El vector de velocidad 3
	integer::i			!El índice del contador
!	integer::aux			!Una variable auxiliar
	integer::error			!No. de errores
	character(len=80)::m_error	!Mensaje de error
	character(len=80)::error_m	!Mensaje de error

!--------------------------------------------------------------------


!--------------------------------------------------------------------
!///////////////////////////////////////////////////////////////////
!--------------------------------------------------------------------

 open ( unit=1, file="A1.dat", status="old", action="read", &
 	iostat=error, iomsg=m_error )

!-------------Si no hay errores--------------------------------------
if ( error==0 ) then

do i=0,48
  read(1,*,iostat=error,iomsg=error_m) X


!----Generar el archivo_V1 con las posiciones y el momento angular para la primer velocidad, V1----------------------------------------
open(unit=2,file="archivo_V1",status="unknown",action="write",	iostat=error,access="append" )
     L1(1)=m*(X(2)*V1(3)-X(3)*V1(2))
     L1(2)=m*(X(3)*V1(1)-X(1)*V1(3))
     L1(3)=m*(X(1)*V1(2)-X(2)*V1(1))
      write(2,*) X, L1

!----Generar el archivo_V2 con las posiciones y el momento angular para la primer velocidad, V2----------------------------------------
open(unit=3,file="archivo_V2",status="unknown",action="write",	iostat=error,access="append")
    L2(1)=m*(X(2)*V2(3)-X(3)*V2(2))
    L2(2)=m*(X(3)*V2(1)-X(1)*V2(3))
    L2(3)=m*(X(1)*V2(2)-X(2)*V2(1))
     write(3,*) X, L2
    
!----Generar el archivo_V3 con las posiciones y el momento angular para la primer velocidad, V3----------------------------------------
open(unit=4,file="archivo_V3",status="unknown",action="write",	iostat=error,access="append")
    L3(1)=m*(X(2)*V3(3)-X(3)*V3(2))
    L3(2)=m*(X(3)*V3(1)-X(1)*V3(3))
    L3(3)=m*(X(1)*V3(2)-X(2)*V3(1))
      write(4,*) X, L1

end do

!----------En caso de existir errores-------------------------------
else 
	print*,error, m_error

end if
!--------------------------------------------------------------------


 close(1)
 close(2)
 close(3)
 close(4)

!--------------------------------------------------------------------
!///////////////////////////////////////////////////////////////////
!--------------------------------------------------------------------



!------------Fin del programa---------------------------------------
end program 
