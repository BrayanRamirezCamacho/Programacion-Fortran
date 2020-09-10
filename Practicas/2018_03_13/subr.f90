SUBROUTINE subr(f,N,res)

  IMPLICIT NONE
  REAL(kind=16),EXTERNAL::serie_1,serie_2,serie_3
  REAL(kind=16)::f
  REAL(kind=16)::i,res,suma,N

  suma=0
  
  DO i=1,N,1
     suma=suma+f(i)
        
  END DO

  res=suma

END SUBROUTINE 
