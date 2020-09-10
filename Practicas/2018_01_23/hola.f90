PROGRAM Hola_0
!Este programa escribe en pantalla le pregunta al usuario su nombre y
!y luego escribe en pantalla
!
!Hola <nombre>
!Bienvenido al curso de Fortran!
!
!(donde <nombre> es sustituido por el nombre del usuario.)
!
!Variables:
!Nombre: variable de character que almancena el nombre.
!

!Declaración de variables:
IMPLICIT NONE
CHARACTER(len=70)::Nombre

!Escribir en pantalla la solicitud del nombre:
PRINT*,"Buenos días, con ayuda del teclado, escribe por favor tu nombre"
!Leer el nombre desde el teclado
READ*, Nombre
!Imprimir el saludo a pantalla:
PRINT*, "Hola", Nombre
WRITE(*,*)"Bienvenido al curso de Fortran!"

!Terminar
END PROGRAM Hola_0
