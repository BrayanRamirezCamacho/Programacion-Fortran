SUBROUTINE areacorregido
  IMPLICIT NONE
  REAL::A,B,C,r,area,s
  LOGICAL::L1,L2,L3

  PRINT*, "Introduzca tres números cualesquiera:"
!Primero se ordenan los lados de menor a mayor usando la función chucho
  READ*,A,B,C
  CALL chucho(A,B,C)
!Ahora los lados ya están ordenados ascendentemente
  
!Primero se verifica que los tres lados formen un triángulo  
		L1=C<A+B
		L2=A<B+C
		L3=B<A+C
		
!Si los lados forman un triángulo, se calcula el área
IF(L1.AND.L2.AND.L3)THEN
	PRINT*,"Los tres números que usted ingresó forman un triángulo"
	s=(A+B+C)/2
	area=SQRT(s*(s-A)*(s-B)*(s-C))
	PRINT*,"y su área es: ",area
	PRINT*,"su perímetro es: ",2*s
END IF

!Si los lados no forman un triángulo
IF(.NOT.(L1.AND.L2.AND.L3))THEN
	PRINT*, "Los lados que usted ingresó no forman un triángulo."
	PRINT*, "Vuelva a intentarlo con otros números."
END IF  

END SUBROUTINE areacorregido
