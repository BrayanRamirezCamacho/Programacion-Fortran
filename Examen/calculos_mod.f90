module calculos
!Usar módulos está bien macizo
    
implicit none
    save
    real ::v0 !La rapidez inicial
    real::theta !El ángulo de tiro
    real::v0x,v0y !Las velocidades iniciales en X y Y
    real,parameter::m=1 !Masa del proyectil
    real,parameter::g=9.80665 !Aceleración gravitatoria
    real,parameter::pi=3.14159 !Pi
    real::t_tot !Tiempo total de vuelo
    integer::n !El número de puntos
    real::dt !El ancho de paso
    integer::i,j !Contadorres
    real::x0,y0 !Las posiciones iniciales en X y Y
    real,allocatable::T(:),Pos(:)
    integer::error !El no. de errores
    character(len=80)::m_error !El mensaje de error1
    character(len=80)::error_m !El mensaje de error2
    character(len=80)::m_error_3 !El mensaje de error3
    character(len=80)::m_error_4 !El mensaje de error4
    real::aux1,aux2,aux3 !Variables auxiliares



contains

!-------------------------------------------------------
!-------------------------------------------------------

subroutine comp
!esta subrutina calcula los componentes de la velocidad

v0x=v0*cos(theta)
v0y=v0*sin(theta)

!print*, v0x, v0y
end subroutine comp

!-------------------------------------------------------
!-------------------------------------------------------

subroutine tiempo
!Esta subrutina
!calcula el tiempo total de vuelo con:
!vy(t)=v0y-g*t
!Se sabe que
!vy(t_tot)=-v0y
!Entonces
!-v0y=v0y-g*t_tot
!-2*v0y=-g*t_tot
!2*v0y=g*t_tot
!Finalmente
!t_tot=(2*v0y)/g

t_tot=(2*v0y)/g

dt=t_tot/n

    
end subroutine tiempo

!-------------------------------------------------------
!-------------------------------------------------------

subroutine tiempos

!open(unit=1,file="new",action="write")
!T(1)=0
!do i=1,n
!	T(i)=T(i)+i*n*T(i)
!	write(*,*), T(i)
!end do 
!close(1)

!-------Dividir memoria de T---------------------------
allocate (T(1:n),STAT=error,ERRMSG=m_error)

if ( error/=0 ) then
	print*, m_error
	stop
end if

!---------------Llenar T, el arreglo de tiempos--------
aux1=0 
do i=1,n
  aux1=i*dt
  T(i)=aux1
  !print*, T(i)
end do

!---------Escribir el archivo con los datos de tiempo------
OPEN(unit=1,file="tiempos",status="new",action="write",iostat=error,iomsg=error_m)

if ( error==0 ) then
   do i=1,n
   	write(1,*) T(i)
   end do

 else
   print*, error_m
 end if

 CLOSE (1)
  
end subroutine tiempos

!-------------------------------------------------------
!-------------------------------------------------------

subroutine posiciones

!-------Dividir memoria de Pos---------------------------
allocate (Pos(1:n,1:n),STAT=error,ERRMSG=m_error_3)

if ( error/=0 ) then
	print*, m_error_3
	stop
end if

!-------Llenar Pos, el arreglo de posiciones------------

aux2=0 
do i=1,n
aux2=i*dt
Pos(i)=aux2*v0x*T(i)

	do j=1,n 
  Pos(j)=v0y*T(i)-(g/2)*T(i)**2
  
	end do

end do
!print*, Pos(j)

!Pos(,)=v0x*T(i)
!Pos(,)=v0y*T(i)-(g/2)*T(i)**2


!------Escribir el archivo con los datos de posición-----
OPEN(unit=2,file="posiciones",status="new",action="write",iostat=error,iomsg=m_error_4)

if ( error==0 ) then
   do i=1,n
   write(2,*) Pos(i)
   		do j=1,n
   		write(2,*) Pos(j)
   		end do
   end do

 else
   print*, m_error_4
 end if

 CLOSE (2)


end subroutine posiciones
!-------------------------------------------------------
!-------------------------------------------------------

end module calculos