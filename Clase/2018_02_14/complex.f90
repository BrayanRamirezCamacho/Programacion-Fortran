PROGRAM complex
  !Declaración de variables
  IMPLICIT NONE
  INTEGER,PARAMETER::kind=SELECTED_REAL_KIND(16,300)
  REAL(kind),PARAMETER:: a=3.43456789243356, b=2.18934522414578
  REAL(kind),PARAMETER:: c=7.57634529413268
  REAL(kind)::m,f,d
  COMPLEX(kind)::x1,x2,C1

  !d es el determinante b²-4ac
  d=(b**2)-(4*a*c)
  C1=CMPLX(d,0)
  x1=(-b+SQRT(C1))/(2*a)
  x2=(-b-SQRT(C1))/(2*a)
  !m es el módulo de los números complejos
  m=ABS(x1)
  PRINT*,"El módulo de las raíces es:"
  PRINT*,m
  PRINT*,
  !f es la fase de los números complejos
  f=ATAN(x1)
  PRINT*,"La fase de las raíces complejas es:"
  PRINT*,f
  PRINT*,
  
  !Impresión en pantalla de las raíces
  PRINT*, "Las raíces complejas son:"
  PRINT*, "x1=",REAL(x1),AIMAG(x1),"i"
  PRINT*, "x2=",REAL(x2),AIMAG(x2),"i"
  

END PROGRAM complex
