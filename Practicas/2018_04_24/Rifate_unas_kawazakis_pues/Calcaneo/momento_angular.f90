PROGRAM momento_angular
implicit none

real,dimension(3):: P, V1=[32,67,9], V2=[2,4,6], V3=[25,7,-1], L1, L2, L3, X
real:: m
integer:: error, i, aux
character(len=40)::errorm

!DATO INICIAL
m=1

!ABRIR ARCHIVO Y LEER POSICIONES
 open(unit=1,file="A1",status="old",action="read",iostat=error,iomsg=errorm)
 if(error==0) then

  CONTADOR: do i=0,48
  read(1,*,iostat=error,iomsg=errorm) X

    !ESCRIBIR EN A_V1 LAS POSICIONES Y EL MOMENTO ANGULAR CON LA VELOCIDAD V1
    open(unit=2,file="A_V1",status="unknown",action="write",iostat=error,access="append")
     L1(1)=m*(X(2)*V1(3)-X(3)*V1(2))
     L1(2)=m*(X(3)*V1(1)-X(1)*V1(3))
     L1(3)=m*(X(1)*V1(2)-X(2)*V1(1))
      write(2,*) X, L1


   !ESCRIBIR EN A_V2 LAS POSICIONES Y EL MOMENTO ANGULAR CON LA VELOCIDAD V2
   open(unit=3,file="A_V2",status="unknown",action="write",iostat=error,access="append")
    L2(1)=m*(X(2)*V2(3)-X(3)*V2(2))
    L2(2)=m*(X(3)*V2(1)-X(1)*V2(3))
    L2(3)=m*(X(1)*V2(2)-X(2)*V2(1))
     write(3,*) X, L2
    print*, X(1)*V2(2), X(2)*V2(1)

   !ESCRIBIR EN A_V3 LAS POSICIONES Y EL MOMENTO ANGULAR CON LA VELOCIDAD V3
   open(unit=4,file="A_V3",status="unknown",action="write",iostat=error,access="append")
    L3(1)=m*(X(2)*V3(3)-X(3)*V3(2))
    L3(2)=m*(X(3)*V3(1)-X(1)*V3(3))
    L3(3)=m*(X(1)*V3(2)-X(2)*V3(1))
      write(4,*) X, L1

  end do CONTADOR

 else
  print*, error, errorm
 end if
 close(1)
   close(2)
   close(3)
   close(4)

!GENERAL PARA CALCULAR COMPONENTES DEL MOMENTO ANGULAR
!L(1)=m*(X(2)*V(3)-X(3)V(2))
!L(2)=m*(X(3)*V(1)-X(1)V(3))
!L(3)=m*(X(1)*V(2)-X(2)V(1))

END PROGRAM momento_angular
