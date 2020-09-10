PROGRAM test1

IMPLICIT NONE
INTEGER, PARAMETER::d=SELECTED_REAL_KIND(16,200)
COMPLEX(d)::c_1,c_2,c_3,c_4,c_5,c_6
COMPLEX(d),PARAMETER::c_7=(3.1416_d,6.3416_d)

PRINT*, "Introduzca c1"
READ*, c_1
PRINT*, "Introduzca c2"
READ*, c_2
PRINT*, "El resultado de la suma de c1 y c2 es:"
 c_3=(c_1)+(c_2)
PRINT*,c_3
PRINT*, "El resultado de la resta de c1 y c2 es:"
 c_4=(c_1)-(c_2)
PRINT*, c_4
PRINT*, "El resultado de la multiplicación de c1 y c2 es:"
 c_5=(c_1)*(c_2)
PRINT*, c_5
PRINT*, "El resultado de la división de c1 y c2 es:"
 c_6=(c_1)/(c_2)
PRINT*, c_6

END PROGRAM test1
