!---------------------------------------------------------------------
!
!Este programa sirve como práctica para usar variables de tipo LOGICAL
!
!Las variables utilizadas son:
!
!         REAL: x,y,a,b,c
!Estas últimas serán introducidas por el usuario.
!Donde "x", "y", "a", "b" y "c" son números reales cualesquiera.   
!
!         LOGICAL: L1,L2,L3,L4,L5
!Estas variables son proposiciones lógicas entre los números.
!Las cuales ya están dadas en schoology por el profesor.
!
!----------------------------------------------------------------------

PROGRAM logical
!Declaración de variables
  IMPLICIT NONE
  REAL::x,y,a,b,c
  LOGICAL::L1,L2,L3,L4,L5

  !Aquí se pide al usuario que introduzca dos números, que serán
  !las variables "x" y "y".
  PRINT*,"Hola, usuario, por favor introduzca cualquier número:"
  READ*,x
  PRINT*,"Este será el número x"
  PRINT*,"Ahora introduzca otro número"
  READ*,y
  PRINT*,"Este será el número y"
  !La primer proposición lógica es:
  L1=x==y

  !Si L1 es verdadera, entonces se imprime el siguiente mensaje:
  IF(L1)THEN
     PRINT*,"Los dos números que ha introducido son iguales."
  END IF
  
PRINT*,
PRINT*,

 !Si L1 es falsa, entonces se imprime el siguiente mensaje:"
  IF(.NOT.L1)THEN
     PRINT*,"Los dos números que ha introducido son diferentes."
  END IF


  PRINT*,"Por favor, introduzca tres números reales"
  PRINT*,"cualesquiera distintos entre sí:"
  PRINT*,"Escriba el primer número, al cual nombraremos a:"
  READ*,a
  PRINT*,"Escriba el segundo número, al cual nombraremos b:"
  READ*,b
  PRINT*,"Escriba el tercer número, al cual nombraremos c:"
  READ*,c
  L2=(b**2)-(4*a*c)<0
  L3=(c**2)>=(a**2)+(b**2)
  L4=0<x.AND.x<=10
  L5=5>=y.AND.y>1
  
 !Si L2 es verdadera, entonces se imprime el siguiente mensaje:
  IF(L2)THEN
     PRINT*,"La proposición b²-4ac<0 es verdadera"
  END IF

  !Si L2 es falsa, entonces se imprime el siguiente mensaje:"
   IF(.NOT.L2)THEN
     PRINT*,"La proposición b²-4ac<0 es falsa"
  END IF

  !Si L3 es verdadera, entonces se imprime el siguiente mensaje:
  IF(L3)THEN
     PRINT*,"La proposición c²≥a²+b²  es verdadera"
  END IF

  !Si L3 es falsa, entonces se imprime el siguiente mensaje:"
  IF(.NOT.L3)THEN
     PRINT*, "La proposición c²≥a²+b es falsa"
  END IF

  !Si L4 es verdadera, entonces se imprime el siguiente mensaje:
  IF(L4)THEN
     PRINT*,"La proposición 0<x≤10 es verdadera"
  END IF

  !Si L4 es falsa, entonces se imprime el siguiente mensaje:"
  IF(.NOT.L4)THEN
     PRINT*,"La proposición 0<x≤1 es falsa"
  END IF

  !Si L5 es verdadera, entonces se imprime el siguiente mensaje:
  IF(L5)THEN
     PRINT*,"La proposición 5≥y>1 es verdadera"
  END IF

  !Si L5 es falsa, entonces se imprime el siguiente mensaje:"
  IF(.NOT.L5)THEN
     PRINT*,"La proposición 5≥y>1 es falsa"
  END IF

 PRINT*,"Gracias por usar este programa. Tenga un buen día."

!Aquí termina el programa
  END PROGRAM logical

  


  
  
 



