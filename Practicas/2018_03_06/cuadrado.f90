  !Esta función calcula el área de un cuadrado, dado su lado l.

FUNCTION areacuadrado(l)

  IMPLICIT NONE
  REAL,INTENT(IN)::l
  REAL::areacuadrado

  areacuadrado=l*l
  
END FUNCTION  areacuadrado
