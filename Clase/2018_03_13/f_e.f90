FUNCTION f_e(x)

IMPLICIT NONE
REAL,INTENT(IN)::x
REAL::f_e

f_e=1/((sqrt(1-x**2))*(1-(0.6*x)**2))

END FUNCTION 