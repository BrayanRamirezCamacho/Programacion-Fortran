PROGRAM simulacion
implicit none

real:: ang, vi, xi, yi, vix, viy, t_, aux1, aux2, ancho, a, b, c,t1, t2, aux3
real,parameter:: g=9.81
real,allocatable:: T(:),X(:),Y(:)
integer:: n, error, i, j
character(len=40):: merror, errorm

!VALORES INICIALES
print*, "ingresa velocidad inicial"
read*, vi
print*, "ingresa posicion inicial en x"
read*, xi
print*, "ingresa posicion inicial en y"
read*, yi
print*, "ingresa el angulo con el que es proyectado el proyectil"
read*, ang

!CONVERTIR ANGULO
aux2=(ang*2*3.1416)/360

!DATOS
vix=vi*cos(aux2)
viy=vi*sin(aux2) 

a=-g/2
b=viy
c=yi

t1=(-b-sqrt(b**2-4*a*c))/(2*a)
t2=(-b+sqrt(b**2-4*a*c))/(2*a)

if (t1>0)then 
t_=t1
else 
t_=t2
end if

print*, "ingresa la cantidad de puntos que quieres conocer"
read*, n

!DIVIDIR MEMORIA DE T, X, Y
!............................................
allocate (T(1:n),STAT=error,ERRMSG=merror)
if(error/=0) then
print*, merror
stop
end if

allocate (X(1:n),STAT=error,ERRMSG=merror)
if(error/=0) then
print*, merror
stop
end if

allocate (Y(1:n),STAT=error,ERRMSG=merror)
if(error/=0) then
print*, merror
stop
end if
!............................................

!REALIZAR N PARTICIONES
ancho=t_/n

!LLENAR A T
aux1=0 
do i=1,n
  aux1=i*ancho
  T(i)=aux1
  !print*, T(i)
end do

!LLENAR A X
aux1=0
do i=1,n
  aux1=xi+vix*i*ancho
  X(i)=aux1
  !print*, X(i)
end do

!LLENAR A Y
do i=1,n
  aux1=yi+viy*i*ancho-(g/2)*(i*ancho)**2
  Y(i)=aux1
  !print*, Y(i)
end do

!ESCRIBIR ARCHIVO CON LOS DATOS X, Y
OPEN(unit=1,file="trayectoria",status="new",action="write",iostat=error,iomsg=errorm)

 if (error==0) then
   do i=1,n
   write(1,*) X(i), Y(i)
   end do

 else
   print*, error, errorm
 end if

 CLOSE (1)

CALL freefall(n,X,Y,T)

END PROGRAM
