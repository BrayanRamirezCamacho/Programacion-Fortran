PROGRAM areacorregido
  IMPLICIT NONE
  REAL::A,B,C,r,area,s
  LOGICAL::L1,L2,L3,L4,L5

  PRINT*, "Introduzca tres números cualesquiera:"
!Primero se ordenan los lados de menor a mayor usando la función chucho
  READ*,A,B,C
  CALL chucho(A,B,C)
!Ahora los lados ya están ordenados ascendentemente
  
!Primero se verifica que los tres lados formen un triángulo  
		L1=C<A+B
		L2=A<B+C
		L3=B<A+C
		L4=L1.AND.L2.AND.L3
		L5=C==A+B

!Si los lados forman un triángulo, se calcula el área
IF(L4)THEN
	PRINT*,"Los tres números que usted ingresó forman un triángulo."
	s=(A+B+C)/2
	area=SQRT(s*(s-A)*(s-B)*(s-C))
	PRINT*,"y su área es: ",area
	PRINT*,"su perímetro es: ",2*s
END IF

!Si los lados no forman un triángulo
IF(.NOT.L4)THEN
	PRINT*, "Los lados que usted ingresó no forman un triángulo."
	PRINT*, "Vuelva a intentarlo con otros números."
END IF  

!Si los lados forman un triángulo degenerado
IF(L5)THEN
	PRINT*, "Los tres números que usted ingresó forman un triángulo..."
	PRINT*, "...pero es un triángulo degenerado y su área es cero."
END IF

	PRINT*,
	PRINT*,"Por si los ha olvidado, los números que usted ingresó son:"
	PRINT*,A,B,C

  END PROGRAM areacorregido
