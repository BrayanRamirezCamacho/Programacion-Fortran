  !Esta función calcula el perímetro de un cuadrado, dados sus lados
FUNCTION pcuadrado(l)
  
  IMPLICIT NONE
  REAL, INTENT(IN)::l
  REAL::pcuadrado

  pcuadrado=4*l

END FUNCTION pcuadrado
