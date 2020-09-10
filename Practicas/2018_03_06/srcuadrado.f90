!===============================================================================
!Esta subrutina calcula el área y perímetro de un cuadrado, usando dos funciones
!===============================================================================
SUBROUTINE srcuadrado

!Declaración de variables
IMPLICIT NONE
REAL,EXTERNAL::areacuadrado,pcuadrado
REAL::A2,P2,l

!Se pide al usuario que escriba el lado de su cuadrado
PRINT*,"Escriba el lado de su cuadrado: "
READ*,l

!Si el usuario escribe un lado positivo o cero, se calcula el área
IF(l>=0)THEN
	A2=areacuadrado(l)
	P2=pcuadrado(l)
	PRINT*,"Su área es: ",A2
	PRINT*,"Y su perímetro es: ",P2
END IF

!Si el usuario escribe un lado negativo no se calcula nada
IF(l<0)THEN
	PRINT*,"No existen cuadrados con lados negativos,"
	PRINT*,"inténtelo de nuevo."
END IF

!Aqui termina la subrutina
END SUBROUTINE
