!=======================================================================
!Este programa calcula el área de triángulos, círculos o cuadrados.
!=======================================================================

PROGRAM areas

!Declaración de variables
  IMPLICIT NONE
  CHARACTER(len=10)::OPCION
  REAL, EXTERNAL::pcirculo,circulo,pcuadrado,areacuadrado
  REAL::r,l

!Se pide al usuario que elija entre las opciones
  PRINT*,"Hola, usuario. ¿Qué desea calcular?"
  PRINT*,"Si desea calcular el área de un círculo, escriba CIRCULO."
  PRINT*,"Si desea calcular el área de un cuadrado, escriba CUADRADO."
  PRINT*,"Si desea calcular el área de un triángulo, escriba TRIANGULO."

  READ*,OPCION

  SELECT CASE(OPCION)
     
!Caso del círculo
  	CASE("CIRCULO")
     		CALL srcirculo
!Caso del cuadrado
  	CASE("CUADRADO")
     		CALL srcuadrado
!Caso del triángulo
  	CASE("TRIANGULO")
		CALL areacorregido

  END SELECT

!Fin del programa
END PROGRAM
