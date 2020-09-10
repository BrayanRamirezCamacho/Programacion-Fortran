MODULE mass_objects

	IMPLICIT NONE

	SAVE

	!!Constantes importantes para el programa

	!!Kind con una precisión de 16 para mayor resolución en el sistema.
	
	INTEGER , PARAMETER :: d = SELECTED_REAL_KIND ( 16 )

	!!Introduciendo las unidades naturales del sistema

	REAL(d),PARAMETER::M0=5.0446E28_d	!!Unidad de masa natural
	REAL(d),PARAMETER::l0=1.495978E11_d	!!Unidad de longitud natural
	REAL(d),PARAMETER::t0=3.1536E7_d	!!Unidad de tiempo natural
	REAL(d),PARAMETER::pi=3.14159265358979_d !!Pi con este Kind

!!Tipo publico para producir objetos del tipo planeta

TYPE,PUBLIC::planet

	REAL(d),DIMENSION(3)::pos	!!Posición en el tiempo t
	REAL(d),DIMENSION(3)::mom	!!Momento Lineal en el tiempo t
	REAL(d),DIMENSION(3)::vel	!!Velocidad en el tiempo t
	REAL(d),DIMENSION(3)::Fgrav	!!Fuerza gravitacional en el tiempo t
	REAL ( d ) :: mass		!!Masa del planeta
	REAL ( d ) :: pos0		!!Posición inicial del planeta
	REAL ( d ) :: Porbit		!!Periodo orbital del planeta
	REAL ( d ) :: v0		!!Rapidez inicial del planeta

END TYPE planet

!!Tipo publico para producir objetos del tipo estrella

TYPE,PUBLIC::Star

	REAL(d),DIMENSION(3)::pos	!!Posición en el tiempo t
	REAL(d),DIMENSION(3)::mom	!!Momento Lineal en el tiempo t
	REAL(d),DIMENSION(3)::vel	!!Velocidad en el tiempo t
	REAL(d),DIMENSION(3)::Fgrav	!!Fuerza gravitacional en el tiempo t
	REAL(d)::mass 			!!Masa de la estrella
	REAL(d)::pos0			!!Posición inicial de la estrella
	REAL(d)::Porbit			!!Periodo orbital de la estrella
	REAL(d)::v0			!!Rapidez inicial de la estrella

END TYPE Star

TYPE, PUBLIC :: data

	REAL ( d ) :: ttot	!!Tiempo total de la simulacion
	REAL ( d ) :: dt	!!Tamaño de paso
	REAL ( d ) :: N_step	!!Cantidad de pasos
	REAL ( d ), DIMENSION ( 3 ) :: Fgnet !!Fuerza gravitacional neta
	REAL ( d ), DIMENSION ( 3 ) :: pos2 !!Vector donde se guarda la
	!!diferencia de posición entre los objetos

END TYPE data

END MODULE mass_objects
