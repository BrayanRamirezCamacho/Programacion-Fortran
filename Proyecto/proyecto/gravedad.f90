PROGRAM test_gravity

  USE mass_objects
  USE vector_functions

  IMPLICIT NONE

  TYPE(planet) :: earth
  TYPE(nave)   :: ship
  TYPE(satellite):: moon    !luna
  TYPE(data)   :: sim

  !!Variables locales

  REAL(d) :: t !!instante de tiempo en cada aproximación
  INTEGER :: unit0 !!Unidad para el archivo de salida

  !! Asignando valores físicos a la nave

  ship%mass = 15E3_d         !!masa
  ship%pos0 = 10.0_d * l0    !!posicion inicial de la nave
  !ship%Porbit = 0.0_d        !!periodo orbital

  !!Asignando valores físicos a la luna

  moon%mass = 7.349E22_d     !!masa
  moon%pos0  = 3.844E8_d      !posicion inicial de la luna
  

  !! Asignando valores físicos al planeta

  earth%mass = 5.976E24_d !masa de la tierra
  earth%pos0 = 0.0 !posicion inicial de la tierra
  !earth%Porbit = 0.0_d !!(Fijo)

  !!Traduciendo a unidades naturales seleccionadas.

  ship%mass = ship%mass/m0
  ship%pos0 = ship%pos0/l0

  earth%mass = earth%mass/m0
  earth%pos0 = earth%pos0/l0

  moon%mass = moon%mass/m0
  moon%pos0 = moon%pos0/l0

  !Calculo de la velocidad inicial de la nave:

  ship%v0 = 3.3E3_d
  ship%v0 = ship%v0/v0

  !construyendo el vector velocidad inicial de la nave:
  ship%vel = vector(0.0_d, ship%v0, 0.0_d)

  !construyendo el vector posicion inicial de la nave:
  ship%pos = vector(ship%pos0,0.0_d,0.0_d)

  !construyendo el vector posicion inicial de la luna: (fija)
  moon%pos = vector(-moon%pos0, 0.0_d, 0.0_d)

  !Vector posicion de la tierra (fijo)
  earth%pos = 0.0_d

  !Vector momento lineal inicial de la nave
  ship%mom = ship%mass*ship%vel

  !!Ajustando el tamaño de paso (cantidad de veces en las que se
  !!actualizará la información del sistema).

  sim%N_step = 1000 !pasos
  sim%ttot = 60*24*60*60 !Tiempo

  sim%ttot = sim%ttot/t0     !Traduciendo a unidades naturales
  sim%dt = sim%ttot/sim%N_step   !calculando el ancho de paso


  !!Abriendo el archivo de texto

  OPEN(NEWUNIT=unit0,FILE="Trayectoria_nave",STATUS="UNKNOWN",ACCESS="APPEND")

  t=0  !tiempo inicial

  !repetir hasta que se compla:

  DO WHILE ( t < sim%ttot )

     sim%pos2= ship%pos-earth%pos   !vector r=r2-r1

     sim%pos3= ship%pos-moon%pos    !vector r2= r2-r3


     !Calculando la interacción gravitacional entre la nave y la tierra

     ship%Fgrav=-1*ship%mass*earth%mass/(mag(sim%pos2)**2)&
          &*(sim%pos2/mag(sim%pos2))

     !Calculando la interacción gravitacional entre la nave y la luna

     ship%Fgrav2=-1*ship%mass*moon%mass/(mag(sim%pos3)**2)&
          &*(sim%pos3/mag(sim%pos3))

     !Calculando la interaccion gravitacional total

     ship%Fgravt= ship%Fgrav + ship%Fgrav2

     !Actualizando el momento lineal

     ship%mom = ship%mom + ship%Fgravt * sim%dt

     !Calculando la velocidad de la nave.
     ship%vel = mag(ship%mom)/ship%mass

     !Actualizando la posicion

     ship%pos = ship%pos + ship%mom / ship%mass * sim%dt

     !Calculando la energia cinetica 
     ship%EnK= 0.5*(ship%mass)*((ship%vel)**2)

     !Calculando la energia potencial nave/tierra
     ship%EnU= -1 * (ship%mass * earth%mass) / mag(sim%pos2)

     !Calculando la energia potencial nave/luna
     ship%EnUmoon= -1 * (ship%mass * moon%mass) / mag(sim%pos3)

     !Calculando la energia potencial total
     ship%EUT= ship%EnU + ship%EnUmoon

     !Calculando energia total.
     ship%EnT= ship%EnK(1) + ship%EUT 

     WRITE(unit0,*)ship%pos(1), ship%pos(2), t, ship%Enk(1), ship%EUT(1), ship%EnT(1)   !!Escribiendo el archivo

     t = t + sim%dt !!actualizacion del tiempo
     print*, mag(ship%pos), l0
     IF (l0*mag(ship%pos)<l0) EXIT

  END DO

  CLOSE (unit0)

OPEN (NEWUNIT = unit0, FILE="tierra", STATUS="UNKNOWN", ACTION="WRITE")
WRITE (unit0,*) earth%pos
CLOSE(2)

OPEN (NEWUNIT = unit0, FILE= "luna", STATUS="UNKNOWN", ACTION="WRITE")
WRITE (unit0,*) moon%pos
CLOSE(3)

	call system ("gnuplot -p graficar.plt")
	!call system ("rm sim_ejemplo")

  call makevideo (ship%pos,earth%pos,moon%pos,t,sim%N_step)

END PROGRAM test_gravity

