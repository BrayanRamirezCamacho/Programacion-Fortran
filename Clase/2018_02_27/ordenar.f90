PROGRAM ordenar

  !
  IMPLICIT NONE
  REAL::x1,x2,x3,x4,x5,r
  CHARACTER(len=5)::OPCION

  PRINT*,"Escriba 5 números cualesquiera: "
  READ*,x1,x2,x3,x4,x5

  !Primero se comparan por parejas
  IF(x3>x4)THEN
     r=x3
     x3=x4
     x4=r
  END IF

  IF(x1>x2)THEN
     r=x1
     x1=x2
     x2=r
  END IF

  IF(x1>x4)THEN
     r=x1
     x1=x4
     x4=r
  END IF

  IF(x2>x3)THEN
     r=x2
     x2=x3
     x3=r
  END IF

  !Ahora se compara el último número
  IF(.NOT.x5>x4)THEN
     IF(x5>x3)THEN
        r=x3
        x3=x5
        x5=x4
	x4=r
     END IF

     IF(.NOT.x5>x3)THEN
        IF(x5>x2)THEN
           r=x2
           x2=x5
           x5=x4
	   x4=x3
	   x3=r
        END IF

        IF(.NOT.x5>x2)THEN
           IF(x5>x1)THEN
              r=x1
              x1=x5
              x5=x4
	      x4=x3
	      x3=x2
	      x2=r
           END IF

           IF(.NOT.x5>x1)THEN
              r=x5
              x1=x5
              x5=x4
	      x4=x3
	      x3=x2
	      x2=x1
	      x1=r
           END IF
        END IF 

     END IF 

  END IF 

  !Los números están ahora ordenados de menor a mayor
  !Ahora se pregunta al usuario el orden de preferido
  PRINT*,"¿Quiere ordenar los números ascendentemente? (SI o NO)"
  READ*, OPCION
  
  SELECT CASE (OPCION)

  CASE("SI")
     PRINT*,x1,x2,x3,x4,x5
     
  CASE("NO")
     PRINT*,x5,x4,x3,x2,x1

  CASE DEFAULT
     PRINT*,"Vuelva a seleccionar, debe escribir SI o NO."

  END SELECT
  
     PRINT*,
     PRINT*,"Adiós vaquero."


END PROGRAM
        
       
