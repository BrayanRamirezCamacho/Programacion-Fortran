PROGRAM imperio
!---------------------------------------------------------------------------------------
!
!Este programa calcula distancias en el problema del Tiro Horizontal.
!En específico, el usuario introduce la velocidad horizontal del móvil
!para luego escribir la altura desde la que es soltado el cuerpo. Entonces
!el programa calcula la distancia horizontal a la que tiene que ser soltado el
!proyectil.
!
!Las variables introducidas por el usuario serán:
!	REAL:: v,h	La velocidad inicial y la altura, respectivamente.
!
!Mientras que las variables calculadas serán:
!	REAL:: d	La distancia horizontal
!
!Y las variables constantes:
!	REAL, PARAMETER:: g=9.8		La acereación gravitatoria de la Tierra
!
!
!La manera de calcular esto es, tomando el movimiento separadamente como una caída libre
!y como un movimiento horizontal a velocidad constante. Así, en el eje X tenemos
!v=d*t, entonces d=vt, por lo que es necesario calcular el tiempo de caída, lo cual
!podemos hacer con el componente de movimiento vertical:
!y=h+(v_0*t)+(0.5*g*(t**2))
!Queremos calcular el tiempo para el cual y=0, y como sabemos que v_0=0, la ecuación
!se simplifica a
!t=sqrt((2*h)/g)
!Ahora sustituimos la anterior ecuación en la expresión que habíamos obtenido al principio
!d=v*sqrt((2*h)/g)
!Pero es necesario hacer conversiones para tener todas las variables en unidades
!consistentes. Yo he decidido convertir la aceleración gravitatoria, g, a km/s²
!para escribir la altura en Km y la velocidad en km/s
!Finalmente la ecuación utilizada por el programa es:
! d=v*sqrt(2*h/(g*(0.001)*(3600**2)))
!
!Este programa está dirigido a usuarios que deseen hacer cálculos del mismo tipo
!de problema, como cualquiera de Tiro Horizontal. Solo basta con cambiar los datos.
!En particular podría llegar a ser usado por usuarios estudiantes de la Lic. en Física
!de la Universidad de Sonora, así como profesores del curso de Programación y 
!Lenguaje Fortran.
!
!---------------------------------------------------------------------------------------

!Declaración de variables
IMPLICIT NONE
REAL::d,v,h
REAL, PARAMETER::g=9.8

!Introducción y descripción del problema
PRINT*, "La Resistencia ha robado un avión para lanzar equipo farmacéutico y alimentos"
PRINT*, "a una población necesitada de la vieja República. Es indispensable que los"
PRINT*, "víveres caigan justo en el centro del poblado si no queremos que se pierdan" 
PRINT*, "(o que caigan en manos del Imperio). Si el Avión viaja a 200 km/h a una altura"
PRINT*, "de 15km. ¿Qué tan lejos del centro del pueblo debe lanzar el cargamento para"
PRINT*, "que llegue a salvo a sus habitantes?"
PRINT*, "Tu labor, como ingeniero a cargo de la nave, es comunicar al piloto" 
PRINT*, "la distancia a la que debe soltar el cargamento." 
PRINT*, "Para ello, realizas los siguientes cálculos:"
PRINT*, "Primero, introduces la velocidad a la que se mueve la nave (en Km/h):"
!Aquí se escribe en el teclado la velocidad de la nave
READ*, v
PRINT*, "Ahora, introduces la altura a la que vuela el avión (en Km):"
!Aquí se teclea la altura de vuelo del avión
READ*, h
!Se calcula la distancia horizontal
d=v*sqrt(2*h/(g*(0.001)*(3600**2)))
PRINT*, "Entonces, ya con tus cálculos hechos comunicas al piloto" 
PRINT*, "que debe soltar las provisiones cuando se encuentre a"
PRINT*, d," Km del poblado."
PRINT*, "Ahora descansas feliz sabiendo que el cargamento fue entregado efectivamente."

!Finaliza el programa

END PROGRAM imperio
