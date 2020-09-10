  !Esta función corresponde a la serie (3), (1/i)-(1/(i+1))

FUNCTION serie_3(i)

  IMPLICIT NONE
  REAL(kind=16),INTENT(IN)::i
  REAL(kind=16)::serie_3

  serie_3=(1/i)-1/(i+1)
  
END FUNCTION serie_3
