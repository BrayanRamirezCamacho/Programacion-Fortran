PROGRAM vel_cte
implicit none

real,dimension(3):: vi=[32,67,9], xi=[0,0,0], x
real:: t
integer:: i, error
character(len=40):: errorm

  open(unit=1,file="A1",status="new",action="write",iostat=error,iomsg=errorm)

  if (error==0) then
   write(1,*) "Un cuerpo parte del origen con velocidad constante vi=[32,67,9] &
   describiendo una trayectoria, a continuacion se muestran &
   las componentes x,y,z de la posicion del objeto durante 24 horas cada media hora:"

   orden: do i=0,48
   t=i/2.
   x=vi*t
   write(1,*) x

   end do orden

   else
    print*, error, errorm
   end if
  close(1)

END PROGRAM 
