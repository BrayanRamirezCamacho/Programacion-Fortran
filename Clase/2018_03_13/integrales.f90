PROGRAM integrales

IMPLICIT NONE
REAL(kind=16),EXTERNAL::f_a,f_b,f_c,f_d,f_e
REAL(kind=16)::a,b,f,res
INTEGER(kind=16)::N

print*, "----------------------------------------------------------------------------"
print*, "Hola, usuario, con este programa usted puede calcular integrales"
print*, "definidas de las siguientes funciones:"
print*, "1) e^(-x²)"
print*, "2) sin(x²)"
print*, "3) cos(x²)"
print*, "4) √(1-(x²)*sin²(x))"
print*, "5) 1/((√(1-x²))*√(1-(0.6*x)²)"
print*, "¿Cuál integral desea calcular?"
read*,f

!Primer integral
IF(f==1)THEN
	print*, "Ingrese el límite inferior de la integral:"
	print*, "(se recomienda 0)"
		read*,a
	print*, "Ingrese el límite superior de la integral:"
	print*, "(se recomienda 2)"
		read*,b
	print*, "Ingrese el grado de la aproximación de la integral:"
		read*,N
	call sumatoria(f_a,N,a,b,res)
	print*, "El valor de la integral en el intervalo dado es: "
		print*,res

!Segunda integral
ELSE IF(f==2)THEN
	print*, "Ingrese el límite inferior de la integral:"
	print*, "(se recomienda 0)"
		read*,a
	print*, "Ingrese el límite superior de la integral:"
	print*, "(se recomienda 2)"
		read*,b
	print*, "Ingrese el grado de la aproximación de la integral:"
		read*,N
	call sumatoria(f_b,N,a,b,res)
	print*, "El valor de la integral en el intervalo dado es: "
		print*,res

!Tercera integral
ELSE IF(f==3)THEN
	print*, "Ingrese el límite inferior de la integral:"
	print*, "(se recomienda 1)"
		read*,a
	print*, "Ingrese el límite superior de la integral:"
	print*, "(se recomienda 2)"
		read*,b
	print*, "Ingrese el grado de la aproximación de la integral:"
		read*,N
	call sumatoria(f_c,N,a,b,res)
	print*, "El valor de la integral en el intervalo dado es: "
		print*,res

!Cuarta integral
ELSE IF(f==4)THEN
	print*, "Ingrese el límite inferior de la integral:"
	print*, "(se recomienda 0)"
		read*,a
	print*, "Ingrese el límite superior de la integral:"
	print*, "(se recomienda π/6)"
		read*,b
	print*, "Ingrese el grado de la aproximación de la integral:"
		read*,N
	call sumatoria(f_d,N,a,b,res)
	print*, "El valor de la integral en el intervalo dado es: "
		print*,res

!Quinta integral
ELSE IF(f==5)THEN
	print*, "Ingrese el límite inferior de la integral:"
	print*, "(se recomienda 0.5)"
		read*,a
	print*, "Ingrese el límite superior de la integral:"
	print*, "(se recomienda 0.9)"
		read*,b
	print*, "Ingrese el grado de la aproximación de la integral:"
		read*,N
	call sumatoria(f_e,N,a,b,res)
	print*, "El valor de la integral en el intervalo dado es: "
		print*,res

!Opción anti-trolleos
ELSE
	print*,"Escoja una opción válida, por favor."

END IF

!Mensaje de despedida
print*,
print*,"Gracias por usar este programa. Vuelva pronto"
print*,"----------------------------------------------------------------------------"

!Fin del programa
END PROGRAM
