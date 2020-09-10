!========================================================================
!Este programa puede calcular n factorial o la suma de los primeros
!n números. n es introducido por el usuario.
!
!Las variables utilizadas serán n,f,s
!
!=======================================================================

PROGRAM repitiendo

  IMPLICIT NONE
  INTEGER,PARAMETER::d=selected_int_kind(30)
  CHARACTER(len=10)::operacion
  INTEGER(d)::n,f,s
  INTEGER(d),EXTERNAL::factorial,suma
  
  
!Se pide al usuario el número n:
  PRINT*,"Hola usuario."
  PRINT*,"Escriba un número natural n: "
  READ*,n
  
!Aquí el usuario decide si desea calcular el factorial o la suma
  PRINT*, "Si desea calcular el factorial de n escriba FACTORIAL;"
  PRINT*, "Si desea calcular la suma de los n primeros enteros,"
  PRINT*, "escriba SUMA."
  
  READ*, operacion
  
  SELECT CASE(operacion)

!Caso del factorial   
  CASE("FACTORIAL")
		
	IF(n>=0)THEN
		f=factorial(n)
		PRINT*,"El producto de los n primeros enteros es:"
  		PRINT*,f
	END IF

!Si el usuario introduce un número negativo, no se calcula nada.
	IF(n<0)THEN
		PRINT*,"El factorial de un número no está definido para enteros negativos."
		PRINT*,"Inténtelo de nuevo."
	END IF

!Caso de la suma
  CASE("SUMA")

	IF(n>=0)THEN
		s=suma(n)
		PRINT*,"La suma de los n primeros enteros es:"
  		PRINT*,s
	END IF

!Si el usuario introduce un número negativo, no se calcula nada.
	IF(n<0)THEN
		PRINT*,"Esta operación no funciona para enteros negativos."
		PRINT*,"Inténtelo de nuevo."
	END IF
	
  END SELECT
  
END PROGRAM
  
  
  
