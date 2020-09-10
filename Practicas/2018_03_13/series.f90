  !Este es el programa maestro para calcular las sumatorias
PROGRAM series

  !Declaración de variables
  IMPLICIT NONE
  REAL(kind=16)::N
  REAL(kind=16),EXTERNAL::serie_1,serie_2,serie_3
  REAL(kind=16)::res,f

  PRINT*,"----------------------------------------------------------"
  PRINT*,"Hola usuario, con este programa podrá calcular alguna"
  PRINT*,"de las siguientes series (comenzando desde i=1 hasta N):"
  PRINT*,"1) Σ((i+1)^2-i^2) "
  PRINT*,"2) Σ(2^(i+1)-2^i) "
  PRINT*,"3) Σ((1/i)-(1/(i+1))) "
  PRINT*,
  PRINT*,"Donde N es el número de sumas parciales de la serie."
  PRINT*,
  
  !Aquí el usuario hace sus decisiones
  PRINT*,"Escoja la serie que desea hacer:"
  PRINT*,"Para calcular la primer serie, escriba 1"
  PRINT*,"Para calcular la segunda serie, escriba 2"
  PRINT*,"Para calcular la tercer serie, escriba 3"
    	READ*,f
  PRINT*,"Ahora escriba N:"
  	READ*,N

 	IF(f==1)THEN
		CALL subr(serie_1,N,res)
		PRINT*,"El resultado de la sumatoria es: "
  		PRINT*,res

 	ELSE IF(f==2)THEN
		CALL subr(serie_2,N,res)
		PRINT*,"El resultado de la sumatoria es: "
  		PRINT*,res   

 	ELSE IF(f==3)THEN
		
		IF(N==0)THEN
			PRINT*,"Las divisiones entre cero no están definidas."
			
		ELSE IF (N>1)THEN
			CALL subr(serie_3,N,res)
			PRINT*,"El resultado de la sumatoria es: "
  			PRINT*,res
		END IF
				
	ELSE IF(f/=1.AND.f/=2.AND.f/=3)THEN
		PRINT*,"Escoja una de las tres opciones disponibles."
		PRINT*,"Vuelva a intentarlo."
  	
	ELSE IF(N<1.AND.N/=0)THEN
		PRINT*,"N, el índice superior de la sumatoria, debe ser mayor a 1."

	
	END IF


  PRINT*,"----------------------------------------------------------"


!Fin del programa  
END PROGRAM series
