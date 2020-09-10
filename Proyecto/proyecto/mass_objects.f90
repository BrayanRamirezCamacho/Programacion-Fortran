MODULE mass_objects

	IMPLICIT NONE

	SAVE

	!!Constantes importantes para el programa

	!!Kind con una precisión de 16 para mayor resolución en el sistema.
	
	INTEGER , PARAMETER :: d = SELECTED_REAL_KIND ( 16 )

	!!Introduciendo las unidades naturales del sistema

	REAL(d),PARAMETER::M0= 2.9897E23_d	       !!Unidad de masa natural
	REAL(d),PARAMETER::l0= 6371E3_d	       !!Unidad de longitud natural
	REAL(d),PARAMETER::t0= 3600.0_d	               !!Unidad de tiempo natural
	REAL(d),PARAMETER::pi= 3.14159265358979_d      !!Pi con este Kind
        REAL(d),PARAMETER::v0= 1769.7222_d             !!Unidad de velocidad natural
	REAL(d),PARAMETER::v02= 0.49158_d

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

TYPE, PUBLIC:: nave

   REAL(d)::mass                                        !Masa
   REAL(d):: pos0
   REAL(d):: v0
   REAL(d) :: Porbit		!!Periodo orbital
   REAL(d), DIMENSION (3) :: Enk
   REAL(d), DIMENSION (3) :: EUT
   REAL(d), DIMENSION (3) :: EnUmoon
   REAL(d), DIMENSION (3) :: EnU
   REAL(d), DIMENSION (3) :: EnT
   REAL(d), DIMENSION (3) :: vel                   !Velocidad
   REAL(d), DIMENSION (3) :: pos       !posición de la nave
   REAL(d), DIMENSION (3) :: Fgrav
   REAL(d), DIMENSION (3) :: Fgrav2
   REAL(d), DIMENSION (3) :: Fgravt
   REAL(d), DIMENSION (3) :: mom
  
END TYPE nave

TYPE, PUBLIC:: satellite

   REAL(d)::mass             !masa
   REAL(d)::pos0
   REAL(d), DIMENSION (3) :: pos
   

END type satellite


TYPE, PUBLIC :: data

	REAL ( d ) :: ttot	!!Tiempo total de la simulacion
	REAL ( d ) :: dt	!!Tamaño de paso
	REAL ( d ) :: N_step	!!Cantidad de pasos
	REAL ( d ), DIMENSION ( 3 ) :: Fgnet !!Fuerza gravitacional neta
        REAL ( d ), DIMENSION ( 3 ) :: pos2 !!Vector donde se guarda la	diferencia                                                !de posición entre la nave y la tierra

        REAL ( d ), DIMENSION ( 3 ) :: pos3  !Vector donde se guarda la diferencia
        !de posicion entre la nave y la luna

END TYPE data

END MODULE mass_objects
