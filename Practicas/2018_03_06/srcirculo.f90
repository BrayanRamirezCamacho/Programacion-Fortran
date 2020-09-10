!==============================================================================
!Esta subrutina calcula el área y perímetro de un círculo, usando dos funciones
!==============================================================================

SUBROUTINE srcirculo

!Declaración de variables
IMPLICIT NONE
REAL,EXTERNAL::circulo,pcirculo
REAL::A1,P1,r

!Se pide al usuario que escriba el radio de su círculo
PRINT*,"Escriba el radio de su círculo: "
READ*,r

!Si el usuario escribe un radio positivo o cero, se hacen los cálculos
IF(r>=0)THEN
	A1=circulo(r)
	P1=pcirculo(r)
	PRINT*,"Su área es: ",A1
	PRINT*,"Y su perímetro es: ",P1
END IF

!Si el usuario escribe un radio negativo, no se calcula nada
IF(r<0)THEN
	PRINT*,"No existen círculos con radio negativo,"
	PRINT*,"inténtelo de nuevo."
END IF


!Aquí termina la subrutina
END SUBROUTINE
