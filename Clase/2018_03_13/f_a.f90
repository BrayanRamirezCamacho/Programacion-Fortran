FUNCTION f_a(x)

IMPLICIT NONE
REAL(kind=16),INTENT(IN)::x
REAL(kind=16)::f_a

f_a=exp(-x**2)

END FUNCTION 