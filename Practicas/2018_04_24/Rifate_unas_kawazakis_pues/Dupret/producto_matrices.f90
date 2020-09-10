PROGRAM producto_matrices
IMPLICIT NONE

real,allocatable:: A(:,:),B(:,:), C(:,:)
integer:: n1,m1,n2,m2, err, i, j, k, f, g
character(len=40):: merr

!PEDIR CANTIDAD DE COLUMNAS Y RENGLONES
print*, "Ingresa la cantidad de renglones de la matriz A"
read*, n1
print*, "Ingresa la cantidad de columnas de la matriz A"
read*, m1

print*, "Ingresa la cantidad de renglones de la matriz B"
read*, n2
print*, "Ingresa la cantidad de columnas de la matriz B"
read*, m2

!DARLE VALOR A LA CANTIDAD DE COLUMNAS Y RENGLONES DE A Y B
allocate (A(1:n1,1:m1),B(1:n2,1:m2),STAT=err,ERRMSG=merr)
if (err/=0) then
print*, merr
stop 
end if

!VERIFICAR SI SON MULTIPLICABLES
verificar: if (m1==n2) then

!SI SI SON, DARLE VALOR A LA CANTIDAD DE COLUMAS Y RENGLONES DE C
allocate (C(1:n1,1:m2),STAT=err,ERRMSG=merr)
if (err/=0) then
print*, merr
stop
end if

!SI NO SON INFORMAR AL USUARIO QUE NO ES POSIBLE REALIZAR LA MULTIPLICACION
else 
print*, "LAS MATRICES NO SE PUEDEN MULTIPLICAR, VERIFICA LA CANTIDAD DE RENGLONES Y COLUMNAS"

end if verificar

!PEDIR VALORES DE LOS ELEMENTOS
print*, "¡¡OJO!! el registro es por columnas y de arriba hacia abajo"
print*, "ingresa el valor de los elementos de la matriz A"
do f=1,n1
do g=1,m1
read*, A(g,f)
end do
end do

print*, "ingresa el valor de los elementos de la matriz B"
do f=1,n1
do g=1,m1
read*, B(g,f)
end do
end do

!BUSCAR VALORES DE LOS ELEMENTOS DE LA MATRIZ C
do i=1,n1
do j=1,m2
C(i,j)=0
do k=1,m1
C(i,j)=C(i,j)+A(i,k)*B(k,j)
end do
end do
end do

!MOSTRAR LA MATRIZ C
print*, "la matriz que resulta de multiplicar A por B es:"
do i=1,n1
print*, (C(i,j),j=1,m2)
end do

END PROGRAM

