!!ATENCIÓN
!!EL PINCHI PROGRAMA NO ESCRIBE NADA EN EL ARCHIVO CREADO
!!¿POR QUÉ SERÁ?

PROGRAM testing_gravity_mod

	USE mass_objects_mod
	USE vector_functions

	IMPLICIT NONE

	!!Definiendo mis objetos masivos

	TYPE(satellite) :: sputnik !Objeto tipo satélite: sputnik
	TYPE(planet) :: moon !Objeto tipo planeta: Luna
	TYPE(planet) :: earth !!Objeto tipo planeta: Tierra
	TYPE(data)   :: sim !!Objeto con información de la simulación

	!!Definiendo variables locales
	
	REAL(d) :: t		!!Instante de tiempo en cada aproximación
	INTEGER :: unit0,unit1!!Unidad para archivo de salida

	LOGICAL:: L1,L2		!Variables lógicas para cuidar las colisiones

!!Asignando valores fı́sicos al planeta (MKS)

	earth%mass = 5.976E24_d 	!!Masa de la Tierra
	earth%pos0 = 0.0_d	!!Posición inicial de la Tierra
	earth%Porbit = 0.0_d	!!Periodo orital de la Tierra
							!!(Fijo en esta aproximación)
	earth%radius = 6.371E6_d	!Radio de la Tierra

!!ELIMINADO: cosas del Sol

!!AÑADIDO
!!Asignando valores fı́sicos a la Luna (MKS)

	moon%mass = 7.3477E22_d	!!Masa de la Luna
	moon%pos0 = 3.844E8_d	!!Posición inicial de la Luna
	moon%Porbit = 0.0_d	!!Periodo orital de la Luna
	!2.360584512E6 m	!!(Fijo en esta aproximación)
	moon%radius = 1.7371E6_d	!Radio de la Luna

!!AÑADIDO
!!Asignando valores fı́sicos al Sputnik (MKS)

	sputnik%mass = 1.5E4_d	!!Masa del Sputnik (15 ton)
	!Casualmente el Sputnik será geoestacionario
	sputnik%pos0 = 4E6_d	!!Posición inicial del Sputnik
!	!Sputnik orbitará la Tierra en un día
!	sputnik%Porbit = 8.64E7_d!!Periodo orital del Sputnik


!!Traduciendo a unidades naturales seleccionadas.
	earth%mass = earth%mass/m0
!	earth%pos0 = earth%pos0/l0
!	earth%porbit = earth%porbit/t0

	sputnik%mass = sputnik%mass/m0
	sputnik%pos0 = sputnik%pos0/l0
	sputnik%Porbit = sputnik%Porbit/t0

!mmmmm aber
!que las unidades naturales sean
!l0=earth%radius
!t0=3600 s 


!!ELIMINADO
!---------------------------------------------------
!Calculo de la rapidez inicial de la Tierra
!asumiendo orbitas circulares
!earth%v0 = 2*pi*earth%pos0/earth%porbit
!---------------------------------------------------
!---------------------------------------------------
!Construyendo el vector de velocidad inicial de la Tierra.
!earth%vel = vector(0.0_d,earth%v0,0.0_d)
!---------------------------------------------------
!---------------------------------------------------
!Construyendo el vector de posición inicial de la Tierra.
!earth%pos = vector(earth%pos0,0.0_d,0.0_d)
!---------------------------------------------------
!---------------------------------------------------
!Vector de posición del Sol (Fijo en esta aproximación)
!sun%pos = 0.0_d
!---------------------------------------------------
!---------------------------------------------------
!!Construyendo el vector de Momento lineal inicial de la Tierra.
!earth%mom = earth%mass*earth%vel
!---------------------------------------------------

!!AÑADIDO
!---------------------------------------------------
!Calculo de la rapidez inicial del Sputnik 
!asumiendo orbitas circulares
sputnik%v0 = 2E5!*t0/l0

!Construyendo el vector de velocidad inicial del Sputnik.
sputnik%vel = vector(0.0_d,sputnik%v0,0.0_d)

!Construyendo el vector de posición inicial del Sputnik.
sputnik%pos = vector(sputnik%pos0,0.0_d,0.0_d)

!!Construyendo el vector de Momento lineal inicial del Sputnik.
sputnik%mom = sputnik%mass*sputnik%vel

!Vector de posición de la Tierra (Fijo en esta aproximación)
earth%pos = vector(0.0_d,0.0_d,0.0_d)


!!ATENCIÓN
!CREO QUE AQUÍ ESTÁ EL ERROR DEL PROGRAMA
!Vector de posición de la Luna (Fijo en esta aproximación)
moon%pos = vector(3.844E8_d,0.0_d,0.0_d)
!---------------------------------------------------

!!Ajustando el tamaño de paso (Cantidad de veces en las que se
!!actualizará la información del sistema).

sim%N_step = 1000				!!Usaré sólo 20 pasos.
sim%ttot = 365*24*60*60		!!En este ejemplo se realizará la
							!!evolución durante un año (en segundos)
sim%ttot = sim%ttot/t0		!!Traduciendo a unidades naturales.
sim%dt = sim%ttot/sim%N_step!!Calculando el ancho de paso

!!Abriendo el archivo de texto
!!AÑADIDO ACTION="WRITE"
OPEN(NEWUNIT=unit0,FILE="simulacion",STATUS="UNKNOWN",ACCESS="APPEND")

t=0	!!La simulación inicia al tiempo t=0

!Repetir el proceso hasta que se cumpla la condición

DO WHILE ( t < sim%ttot )

!!Calculando el vector r=r2-r1 entre la Tierra y el Sputnik
	sim%pos2 = sputnik%pos-earth%pos

!!AÑADIDO
!!Calculando el vector r=r2-r1 entre la Luna y el Sputnik
	sim%pos3 = sputnik%pos-moon%pos

!!AÑADIDO
!Si el Sputnik colisiona con la Tierra o la Luna, 
!se detiene la simulación
L1=mag(sim%pos2)<earth%radius/mag(sim%pos2)
L2=mag(sim%pos3)<moon%radius/mag(sim%pos3)

!IF ( L1 .or. L2 ) EXIT

!!Calculando la interacción gravitacional entre Tierra y Sputnik.

	earth%Fgrav=-1*earth%mass*sputnik%mass/(mag(sim%pos2)**2)&
		     &*(sim%pos2/mag(sim%pos2))

!!AÑADIDO
!!Calculando la interacción gravitacional entre la Luna y Sputnik.

	moon%Fgrav=-1*moon%mass*sputnik%mass/(mag(sim%pos3)**2)&
		     &*(sim%pos3/mag(sim%pos3))

!!AÑADIDO
!!Actualizando el momento lineal del Sputnik:
!	sputnik%mom = sputnik%mom + earth%Fgrav * sim%dt
!	sputnik%mom = sputnik%mom + moon%Fgrav * sim%dt
!Es necesario unificar las dos expresiones anteriores,
!pienso que una manera podría ser la siguiente:
	sputnik%mom = sputnik%mom + (earth%Fgrav + moon%Fgrav) * sim%dt
!ya que los vectores de fuerza se suman,
!dando una fuerza total o resultante.

!!AÑADIDO
!!Actualizando la posición del Sputnik

	sputnik%pos = sputnik%pos + sputnik%mom / sputnik%mass *  sim%dt

!!Escribiendo en el archivo
	WRITE(unit0,*)sputnik%pos(1),sputnik%pos(2),t 

!!Actualizando el tiempo
	t = t + sim%dt


END DO

CLOSE ( unit0 )

!Esto debe modificarse:
!---------------------------------------------------
!!Este archivo sirve para la información del sol
OPEN ( NEWUNIT = unit0 , FILE = "earth" , STATUS = "UNKNOWN", ACTION = "WRITE")
WRITE ( unit0 , * ) earth%pos
CLOSE ( 2 )
       CALL SYSTEM("gnuplot -p graficar.plt")
       !CALL SYSTEM("rm G")
!---------------------------------------------------


END PROGRAM testing_gravity_mod





