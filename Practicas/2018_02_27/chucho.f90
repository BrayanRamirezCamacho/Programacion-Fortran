!Esta función llamado chucho toma tres valores y los ordena de menor a mayor

SUBROUTINE chucho(A,B,C)
    IMPLICIT NONE
  REAL::A,B,C,r

  !Si B es mayor a C, aquí se cambian de lugar para invertir su orden
  IF(B>C)THEN
     r=B
     B=C
     C=r
  END IF
  !Si B es menor a C, no se hace nada porque ya están ordenados de menor a mayor
  
  !Si A es mayor a B, aquí se cambian de lugar para invertir su orden
  IF(A>B)THEN
     r=A
     A=B
     B=r
  END IF
  !Si A es menor a B, no se hace nada porque ya están ordenados de menor a mayor
  

  IF(B>C)THEN
     r=B
     B=C
     C=R
  END IF

  RETURN

END SUBROUTINE chucho


  
