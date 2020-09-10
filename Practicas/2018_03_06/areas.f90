!=======================================================================
!Este programa calcula el área de triángulos, círculos o cuadrados.
!=======================================================================

PROGRAM areas
  IMPLICIT NONE
  CHARACTER::OPCION
  REAL, EXTERNAL::pcirculo,circulo,pcuadrado,areacuadrado
  REAL::A1,P1,A2,P2
  REAL::r,l

!Se pide al usuario que elija entre las opciones
  PRINT*,"Hola, usuario. ¿Qué desea calcular?"
  PRINT*,"Si desea calcular el área de un círculo, escriba CIRCULO."
  PRINT*,"Si desea calcular el área de un círculo, escriba CUADRADO."
  PRINT*,"Si desea calcular el área de un círculo, escriba TRIANGULO."

  READ*,OPCION

  SELECT CASE(OPCION)
     
!Caso del círculo
  	CASE("CIRCULO")
     	PRINT*,"Escriba el radio de su círculo:"
     	READ*,r
	A1=circulo(r)
	P1=pcirculo(r)
	PRINT*,"Su área es: ",A1
	PRINT*,"Y su perímetro es: ",P1

!Caso del cuadrado
  	CASE("CUADRADO")
     	PRINT*,"Escriba el lado de su cuadrado: "
	READ*, l
	A2=areacuadrado(l)
	P2=pcuadrado(l)
	PRINT*,"Su área es: ",A2
	PRINT*,"Y su perímetro es: ",P2

!Caso del triángulo
  	CASE("TRIANGULO")
		CALL areacorregido

  END SELECT


END PROGRAM
