!=================================================================
!Esta función calcula el factorial de n, donde n es introducido 
!por el usuario y es un número entero positivo.
!=================================================================


FUNCTION factorial(n)
  
  IMPLICIT NONE
  INTEGER,INTENT(IN)::n
  INTEGER::factorial
  INTEGER::i

  i=1
  factorial=1
  DO
     IF(i>n)EXIT
     factorial=factorial*i
     i=i+1
  END DO      

END FUNCTION
