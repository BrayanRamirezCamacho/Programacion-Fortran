PROGRAM area

!Declaración de variables
IMPLICIT NONE
REAL::a,b,c,s
REAL::x
LOGICAL::p,q

!Se indica al usuario las intrucciones del programa
PRINT*,"Escriba los lados de un triángulo en orden ascendente:"
PRINT*,"Primero escriba el primer lado, a éste lo llamaremos a:"
READ*,a
PRINT*,"Escriba ahora el segundo lado, lo llamaremos b:"
READ*,b
PRINT*,"Por último escriba el tercer lado, éste será c:"
READ*,c

!Se utiliza la fórmula de Herón para calcular el área del triángulo
S=(a+b+c)/2
x=sqrt(s*(s-a)*(s-b)*(s-c))
!p es una proposición que dice que c es mayor que a y b
p=c>a.AND.c>b
!Si a,b y c forman un triángulo, entonces tienen que cumplir con 
!la desigualdad del triángulo
q=ABS(c)<=ABS(a+b)

!Si el usuario introduce el lado más grande del triángulo como c, entonces
!se imprime el area del triángulo
IF(p)THEN
PRINT*,"El area de su triángulo es:"
PRINT*,x
PRINT*,"Por si los ha olvidado, los lados de su triángulo son:"
PRINT*,"a=",a
PRINT*,"b=",b
PRINT*,"c=",c
PRINT*, "Adiós. Arrivederci. Adeus. Au revoir. Goodbye."
END IF

IF(.NOT.p)THEN
PRINT*, "El lado que usted introdujo como c no es el mayor de los tres,"
PRINT*, "Vuelva a intentarlo."
PRINT*, "Adiós. Arrivederci. Adeus. Au revoir. Goodbye."
END IF

PRINT*,
!Si los números no forman un triángulo se despliega el siguiente mensaje:
IF(.NOT.q)THEN
PRINT*, "Los números que usted ha introducido no forman un triángulo,"
PRINT*, "Vuelva a intentarlo."
END IF

!Aqui termina el programa
END PROGRAM
