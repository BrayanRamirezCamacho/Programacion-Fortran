!------------------------------------------------------------------------
!Hola we, este programa te va a servir para:
!1.Obtener el volumen de una esfera a partir de su radio.
!2.Realizar operaciones (suma, resta, división, multiplicación) entre
!números complejos (sin usar COMPLEX).
!3.Resolver ecuaciones cuadráticas usando la fórmula general.
!
!Las variables utilizadas serán:
!
!REAL::numero1real,numero1imag,numero2real,numero2imag
!REAL::a,b,c,x1,x2,preal,pimag,rreal,rimag,V,r,nu1imag,nu1real,nu2imag,nu2real
!REAL:: num1real, num1imag, num2real, num2imag, partereal, parteimag
!REAL:: nom1real, nom1imag, nom2real, nom2imag, resreal, resimag, denom
!CHARACTER(len=20):: OPERACION
!INTEGER:: OPCION
!REAL, PARAMETER:: pi=3.14159265359
!
!En específico, el usuario escribirá las siguientes variables:
!Los coeficientes de una ecuación cuadrática:
!REAL::a,b,c,
!El radio de una esfera:
!REAL::r,
!Y números complejos:
!REAL::nu1imag,nu1real,nu2imag,nu2real
!REAL::numero1real,numero1imag,numero2real,numero2imag
!REAL:: num1real, num1imag, num2real, num2imag
!REAL:: nom1real, nom1imag, nom2real, nom2imag
!
!
!-----------------------------------------------------------------------

PROGRAM ejercicio

!Declaración de variables
IMPLICIT NONE
INTEGER,PARAMETER::rango=SELECTED_REAL_KIND(10,300)
REAL(rango)::numero1real,numero1imag,numero2real,numero2imag
REAL(rango)::a,b,c,x1,x2,preal,pimag,rreal,rimag,V,r,nu1imag,nu1real,nu2imag,nu2real
REAL(rango):: num1real, num1imag, num2real, num2imag, partereal, parteimag
REAL(rango):: nom1real, nom1imag, nom2real, nom2imag, resreal, resimag, denom, d
CHARACTER(len=20):: OPERACION
INTEGER:: OPCION
REAL, PARAMETER:: pi=3.14159265359

!Aquí el usuario escoge lo que quiere hacer con el programa.
PRINT*, "Hola, ¿qué desea hacer?"
PRINT*, "Si desea obtener el volumen de una esfera, presione 1"
PRINT*, "Si desea realizar operaciones entre números complejos, presione 2"
PRINT*, "Si desea resolver ecuaciones cuadráticas, presione 3"

READ*,OPCION

SELECT CASE (OPCION)

!Primer caso: esfera
CASE(1)
PRINT*, "Por favor introduzca el radio de la esfera:"
READ*, r
V=(4./3.)*pi*(r**3)
PRINT*, "El volumen de su esfera es:"
PRINT*, V

!Segundo caso: operaciones entre complejos
CASE(2)

PRINT*,"Por favor introduzca la operación que desea realizar entre dos números"
PRINT*,"complejos de la forma a+bi."
PRINT*,"Si desea hacer una suma, escriba SUMA."
PRINT*,"Si desea hacer una resta, escriba RESTA."
PRINT*,"Si desea hacer una multiplicación, escriba PRODUCTO"
PRINT*,"Si desea hacer una división, escriba COCIENTE."

	READ*, OPERACION
	SELECT CASE(OPERACION)
	
!Subcaso: suma	
CASE("SUMA")
	       PRINT*, "Introduzca el primer número con el que desea operar"
	       PRINT*, "Primero escriba la parte real:"
	       READ*, numero1real
	       PRINT*, "Ahora, escriba la parte imaginaria"
	       READ*, numero1imag
	       PRINT*, "Escriba entonces la parte real del segundo número:"
	       READ*, numero2real
	       PRINT*, "Por último, escriba la parte imaginaria"
	       PRINT*, "del segundo número complejo:"
	       READ*, numero2imag
	       preal=(numero1real+numero2real)
	       pimag=(numero1imag+numero2imag)
	       PRINT*, "El resultado es:"
	       PRINT*, preal,"+ i",pimag

!Subcaso: resta	       
CASE("RESTA")
	PRINT*, "Introduzca el primer número con el que desea operar"
	PRINT*, "Primero escriba la parte real:"
	READ*, nu1real
	PRINT*, "Ahora, escriba la parte imaginaria" 
	READ*, nu1imag
	PRINT*, "Escriba entonces la parte real del segundo número:"
	READ*, nu2real
	PRINT*, "Por último, escriba la parte imaginaria del segundo número complejo"
	READ*, nu2imag
	rreal=(nu1real-nu2real)
	rimag=(nu1imag-nu2imag)
	PRINT*, "El resultado es:"
	PRINT*, rreal,"+ i",rimag
	
!Subcaso: multiplicación
CASE("PRODUCTO")
PRINT*, "Introduzca el primer número con el que desea operar"
	PRINT*, "Primero escriba la parte real:"
	READ*, num1real
	PRINT*, "Ahora, escriba la parte imaginaria" 
	READ*, num1imag
	PRINT*, "Escriba entonces la parte real del segundo número:"
	READ*, num2real
	PRINT*, "Por último, escriba la parte imaginaria del segundo número"
	READ*, num2imag
	partereal=(num1real*num2real-num1imag*num2imag)
	parteimag=(num1real*num2imag+num1imag*num2real)
	PRINT*, "El resultado es:"
	PRINT*, partereal,"+ i",parteimag

!Subcaso: división
CASE("COCIENTE")
PRINT*, "Introduzca el primer número con el que desea operar (el numerador)"
	PRINT*, "Primero escriba la parte real:"
	READ*, nom1real
	PRINT*, "Ahora, escriba la parte imaginaria" 
	READ*, nom1imag
PRINT*, "Introduzca el segundo número con el que desea operar (el denominador)"
	PRINT*, "Escriba entonces la parte real del segundo número:"
	READ*, nom2real
	PRINT*, "Por último, escriba la parte imaginaria del segundo número"
	READ*, nom2imag
	denom=(nom2real**2)+(nom2imag**2)
	resreal=(nom1real*nom2real+nom1imag*nom2imag)/(denom)
	resimag=(nom1imag*nom2real-nom1real*nom2imag)/(denom)
	PRINT*, "El resultado es:"
	PRINT*, resreal,"+ i",resimag

END SELECT

!Tercer caso: resolver cuadráticas
CASE(3)
PRINT*, "Si su ecuación es de la forma ax^2+bx+c=0,"
PRINT*, "escriba los coeficientes de su ecuación cuadrática," 
PRINT*, "comenzando por a, luego b y finalmente c:"
READ*, a
READ*, b
READ*, c
d=(b**2)-(4.*a*c)

!Determinante positivo: raíces reales
IF(d>0)THEN
x1=(-b+(d**0.5))/(2.*a)
x2=(-b-(d**0.5))/(2.*a)
PRINT*, "Las soluciones de su ecuación son reales y su valor es:"
PRINT*, "x1=",x1," y ","x2=",x2
END IF

!Determinante cero: raíces iguales
IF(d=0)THEN
x1=-b/(2.*a)
x2=-b/(2.*a)
PRINT*, "Las soluciones de su ecuación son iguales y su valor es:"
PRINT*, "x1=",x1," y ","x2=",x2
END IF

!Determinante negativo: raíces complejas
IF(d<0)THEN
PRINT*, "Las soluciones de su ecuación son complejas y su valor es:"
PRINT*, "x1=",(-b/(2.*a))," + i",(((-d)**0.5)/(2.*a))
PRINT*, " y "
PRINT*, "x2=",(-b/(2.*a))," - i",(((-d)**0.5)/(2.*a))
END IF

END SELECT

!Aquí termina el programa
END PROGRAM ejercicio

