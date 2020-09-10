FUNCTION f_d(x)

IMPLICIT NONE
REAL,INTENT(IN)::x
REAL::f_d

f_d=sqrt(1-(x**2)*sin(x)**2)

END FUNCTION 