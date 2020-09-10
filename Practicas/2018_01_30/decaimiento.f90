PROGRAM decaimiento
!----------------------------------------------------------------------------------
!Este programa usa la ley de decaimiento radioactivo 
!(decaimiento exponencial) para calcular la masa de 
!una sustancia radioactiva como función del tiempo, M(t).
!Las variables usadas son:
!	M_0	:cantidad de sustancia en un tiempo t_0=0, (en mg)
!	tau	:Vida Media de la sustancia de trabajo (en dias)
!	t	:tiempo en el cual se quiere calcular la cantidad restante (en días)
!	M	:cantidad de sustancia remanente a un tiempo 't' (en mg)
!	
!Entrada:	M_0, tau, t
!Salida:	M
!
!Este programa será usado por usuarios que deseen calcular la masa remantente de una
!sustancia radioactiva. Podrían ser estudiantes de la Lic. en Física en la Unison.
!
!-----------------------------------------------------------------------------------

IMPLICIT NONE
REAL::M_0,tau,t, M
REAL, PARAMETER::e=2.718281828

PRINT*, "Por favor, introduzca el tiempo de vida media (en días)"
PRINT*, "de la sustancia radioactiva con la que estará usted trabajando:"
!Introducir en el teclado la vida media (en días)
READ*, tau
!Introducir la masa de sustancia M_0 (en mg) en un tiempo inicial t_0
PRINT*, "Introduzca entonces la cantidad de sustancia (en mg) en un tiempo inicial:"
READ*, M_0
PRINT*, "Ahora, ¿En qué tiempo 't' (en días) quiere usted calcular la masa de sustancia restante?"
READ*, t
!Calcular con la siguiente ecuación la masa M en un tiempo t
PRINT*, "La masa remanente (en mg) después de ese tiempo será:"
M=(M_0)*(e**(-t/(tau)))
PRINT*, M
PRINT*, "Buena suerte trabajando con Polonio!"


END PROGRAM decaimiento
