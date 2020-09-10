!Este programa es para probar la función de suma.
PROGRAM calar

  IMPLICIT NONE
  INTEGER::n,S
  INTEGER,EXTERNAL::suma

  PRINT*,"Escriba un numero n:"
  READ*,n
  S=suma(n)
  
  PRINT*,"La suma de los n primeros enteros es:"
  PRINT*,S

END PROGRAM calar
