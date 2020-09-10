!Este programa es para probar la función factorial.
PROGRAM calarfactorial

  IMPLICIT NONE
  INTEGER::n,f
  INTEGER,EXTERNAL::factorial

  PRINT*,"Escriba un numero n:"
  READ*,n
  f=factorial(n)
  
  PRINT*,"El producto de los n primeros enteros es:"
  PRINT*,f

END PROGRAM calarfactorial
