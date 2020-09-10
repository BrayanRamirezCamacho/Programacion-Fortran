!=================================================================
!Esta función hace la suma de los n primeros números enteros,
!donde n es introducido por el usuario y es un número entero
!positivo.
!=================================================================


FUNCTION suma(n)
  
  IMPLICIT NONE
  INTEGER,PARAMETER::d=selected_int_kind(30)
  INTEGER(d),INTENT(IN)::n
  INTEGER(d)::suma
  INTEGER::i

  i=0
  suma=0
  DO
     IF(i>n)EXIT
     suma=suma+i
     i=i+1
  END DO      

END FUNCTION
