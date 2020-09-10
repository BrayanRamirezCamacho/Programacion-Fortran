program simulacion2

use calculos

implicit none

!-------------------------------------------------------
print*,"Ingrese la rapidez inicial del proyectil:"
read*,v0
print*,"Ingrese el ángulo de lanzamiento del proyectil (en grados):"
read*,theta
!Conversión de theta a radianes
theta=theta*(pi/180)

!Calculo de los componentes de la velocidad inicial
call comp

print*, "theta=",theta
print*, "v0x=",v0x
print*, "v0y=",v0y

print*,"Ingrese, n, el número de puntos que desea tomar:"
read*, n

!Calculo del tiempo total
call tiempo

print*,"t_tot=",t_tot
print*,"dt=",dt

!Aqui se llena el arreglo con los tiempos
call tiempos

!Aqui se llena el arreglo con las posiciones
call posiciones





end program