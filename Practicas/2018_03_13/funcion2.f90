  !Esta función corresponde a la serie (2), 2^{i+1}-2^i

FUNCTION serie_2(i)

  IMPLICIT NONE
  REAL(kind=16),INTENT(IN)::i
  REAL(kind=16)::serie_2

  serie_2=2**(i+1)-2**i
  

END FUNCTION serie_2
