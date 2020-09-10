SUBROUTINE sumatoria(f,N,a,b,res)

  IMPLICIT NONE
  REAL(kind=16),EXTERNAL::f_a,f_b,f_c,f_d,f_e !Las funciones matemáticas
  REAL(kind=16),EXTERNAL::f                            !La función
  REAL(kind=16)::res,suma
  INTEGER(kind=16)::N                 !
  REAL(kind=16)::h,b,a,x
  INTEGER::i
  

  h=(b-a)/N
  suma=0

  DO i=1,N-1
     x=a+i*h
     suma=suma+f(x)
        
  END DO

  res=(h/2)*(f(a)+2*suma+f(b))

END SUBROUTINE 
