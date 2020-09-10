  !Esta función calcula el perímetro de un círculo.

FUNCTION pcirculo(r)

  IMPLICIT NONE
  REAL,INTENT(IN)::r
  REAL::pcirculo
  REAL,PARAMETER::pi=3.14159265359

  pcirculo=2*pi*r

END FUNCTION
