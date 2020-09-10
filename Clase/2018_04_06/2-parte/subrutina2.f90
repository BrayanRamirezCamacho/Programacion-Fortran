!Esta subrutina calcula la pendiente y la ordenada al origen
!de la recta que mejor se ajuste a datos con comportamiento
!lineal, mediante una regresión lineal.

subroutine s(sumx,sumxx,sumxy,xm,ym,m,b)
    implicit none
    real :: sumx,sumxx,sumxy,xm,ym,m,b

    !Cálculo de la pendiente
    m=(sumxy-sumx*ym)/(sumxx-sumx*xm)

    !Cálculo de la ordenada al origen
    b=ym-m*xm
    
end subroutine s