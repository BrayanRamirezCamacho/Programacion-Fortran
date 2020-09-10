  !Esta función calcula el área de un círculo.

FUNCTION circulo(r)

  IMPLICIT NONE
  REAL,INTENT(IN)::r
  REAL::circulo
  REAL,PARAMETER::pi=3.14159265359

  circulo=pi*r**2

END FUNCTION
