PROGRAM ordenar_num
IMPLICIT NONE 

INTEGER:: n, sel1, error, error0, i
CHARACTER(LEN=40):: nombre_archivo, merr, error_msg, sel2
REAL,ALLOCATABLE:: X(:)

PRINT*, "Aquí podras ordenar de manera ascendente o descendente según desees números reales"
PRINT*, "Ademas podrás ingresar las cantidades desde el teclado o por medio de un archivo de texto"
PRINT*, "¿De que manera deseas ingresar?"
PRINT*, "1. Ingresar desde el teclado 2. Ingresar con un archivo de texto"
READ*, sel1

selector: SELECT CASE (sel1)

CASE (1)
  PRINT*, "Ahora, ingresa la cantidad n de numeros que deseas ordenar"
  READ*, n

  ALLOCATE(X(1:n),STAT=error,ERRMSG=merr)
  IF (error/=0) THEN
  PRINT*, error
  STOP
  END IF
  
  PRINT*, "Ingresa los n elementos"
  READ*, X(1:n)

CASE(2)
  PRINT*, "Ingresa nombre del archivo"
  READ*, nombre_archivo

   OPEN (UNIT=1,FILE=nombre_archivo,STATUS="old",ACTION="read",IOSTAT=error0,IOMSG=error_msg)

   IF_PRINCIPAL: IF (error==0) THEN
   n=0

   DO ! PRIMER DO
   

   READ(1,*,iostat=error0,iomsg=error_msg) 
   IF(error0/=0) EXIT
   n=n+1
   END DO !PRIMER DO
   CLOSE (1)

     !.........................................
     ALLOCATE(X(1:n),STAT=error,ERRMSG=merr)
     IF (error/=0) THEN
     PRINT*, error
     STOP
     END IF
     !.........................................

   OPEN (UNIT=1,FILE=nombre_archivo,STATUS="old",ACTION="read",IOSTAT=error0,IOMSG=error_msg)
    DO i=1,n
      READ(1,*,iostat=error0,iomsg=error_msg) X(i)
    END DO

  IF_SECUNDARIO: IF (error>0) THEN 
  PRINT*, error_msg, error0
  ELSE 
  !PRINT*, "Se acabaron las lineas del archivo"
  END IF IF_SECUNDARIO

  ELSE
  PRINT*, error_msg, error
   CLOSE (1)
  END IF IF_PRINCIPAL


CASE DEFAULT
PRINT*, "No ingresaste ninguna opcion disponible"
END SELECT selector

PRINT*, "¿De que manera deseas ordenarlos? A- Ascendente o D- Descendente"
READ*, sel2

CALL comb_sort(n,X)

IF (sel2=="A") THEN
DO i=1,n
PRINT*, X(i)
END DO
END IF

IF (sel2=="D") THEN
DO i=n,1,-1
PRINT*, X(i)
END DO
END IF

END PROGRAM ordenar_num
