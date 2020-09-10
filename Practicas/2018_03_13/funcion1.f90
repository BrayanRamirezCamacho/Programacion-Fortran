  !Esta función corresponde a la serie (1), (i+1)²-i²

FUNCTION serie_1(i)

  IMPLICIT NONE
  REAL(kind=16),INTENT(IN)::i
  REAL(kind=16)::serie_1

  serie_1=(i+1)**2-i**2
  

END FUNCTION serie_1
