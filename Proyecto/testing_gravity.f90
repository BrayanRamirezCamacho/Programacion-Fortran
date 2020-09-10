PROGRAM testing_gravity

	USE mass_objects
	USE vector_functions

	IMPLICIT NONE

	!!Definiendo mis objetos masivos

	TYPE(planet) :: earth	!!Objeto tipo planeta: Tierra
	TYPE(star)   :: sun	!!Objeto tipo estrella: Sol
	TYPE(data)   :: sim	!!Objeto con información de la simulación

	!!Definiendo variables locales
	
	REAL(d) :: t		!!Instante de tiempo en cada aproximación
	INTEGER :: unit0	!!Unidad para archivo de salida

!!Asignando valores fı́sicos al planeta (MKS)

	earth%mass = 5.976E24_d 	!!Masa de la Tierra
	earth%pos0 = 1.495978E11_d	!!posición inicial de la Tierra
	earth%Porbit = 3.1536E7_d	!!Periodo orital de la Tierra

!!Asignando valores fı́sicos a la estrella (MKS)

	sun%mass = 1.989E30_d	!!Masa del Sol
	sun%pos0 = 0.0_d	!!Posición inicial del Sol
	sun%Porbit = 0.0_d	!!Periodo orital del Sol
				!!(Fijo en esta aproximación)

!!Traduciendo a unidades naturales seleccionadas.

	earth%mass = earth%mass/m0
	earth%pos0 = earth%pos0/l0
	earth%porbit = earth%porbit/t0
	sun%mass = sun%mass/m0

!Calculo de la rapidez inicial de la Tierra
!asumiendo orbitas circulares
earth%v0 = 2*pi*earth%pos0/earth%porbit

!Construyendo el vector de velocidad inicial de la Tierra.
earth%vel = vector(0.0_d,earth%v0,0.0_d)

!Construyendo el vector de posición inicial de la Tierra.
earth%pos = vector(earth%pos0,0.0_d,0.0_d)

!Vector de posición del Sol (Fijo en esta aproximación)
sun%pos = 0.0_d

!!Construyendo el vector de Momento lineal inicial de la Tierra.
earth%mom = earth%mass*earth%vel

!!Ajustando el tamaño de paso (Cantidad de veces en las que se
!!actualizará la información del sistema).

sim%N_step = 20			!!Usaré sólo 20 pasos.
sim%ttot = 365*24*60*60		!!En este ejemplo se realizará la
				!!evolución durante un año (en segundos)
sim%ttot = sim%ttot/t0		!!Traduciendo a unidades naturales.
sim%dt = sim%ttot/sim%N_step 	!!Calculando el ancho de paso

!!Abriendo el archivo de texto

OPEN(NEWUNIT=unit0,FILE="Sim_ejemplo",STATUS="UNKNOWN",ACCESS="APPEND")

t=0	!!La simulación inicia al tiempo t=0

!Repetir el proceso hasta que se cumpla la condición

DO WHILE ( t < sim%ttot )

	sim%pos2 = earth%pos-sun%pos	!!Calculando el vector r=r2-r1

!!Calculando la interacción gravitacional.

	earth%Fgrav=-1*earth%mass*sun%mass/(mag(sim%pos2)**2)&
		     &*(sim%pos2/mag(sim%pos2))

!!Actualizando el momento lineal
	
	earth%mom = earth%mom + earth%Fgrav * sim%dt

!!Actualizando la posición

	earth%pos = earth%pos + earth%mom / earth%mass * sim%dt

	WRITE(unit0,*) t , earth%pos	!!Escribiendo en el archivo

	t = t + sim%dt	!!Actualizando el tiempo


ENDDO

CLOSE ( unit0 )

!!Este archivo sirve para la información del sol

OPEN ( NEWUNIT = unit0 , FILE = "sun" , STATUS = "UNKNOWN" )
WRITE ( unit0 , * ) sun%pos
CLOSE ( 2 )

END PROGRAM testing_gravity





