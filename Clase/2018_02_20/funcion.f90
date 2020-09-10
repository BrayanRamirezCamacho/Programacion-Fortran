!-----------------------------------------------------------
!La función f(x,y) está definida por partes, vale:
!-x²+y²    si x>=0 y y y>=0
!-
!-
!-
!
!-----------------------------------------------------------

PROGRAM funcion

  IMPLICIT NONE
  REAL::func,x,y

  PRINT*,"Introduzca dos números reales x y y:"
  READ*,x
  READ*,y

  IF(x>=0.AND.y>=0)THEN
     func=(x**2)+(y**2)
  ELSE IF(x<0.AND.y<0)THEN
     func=(x**2)-(y**2)
  ELSE IF(x>0.AND.y<0)THEN
     func=(x**2)+y
  ELSE
     func=x+(y**2)
  END IF

  PRINT*,"La función vale:"
  PRINT*, func

END PROGRAM funcion
 
