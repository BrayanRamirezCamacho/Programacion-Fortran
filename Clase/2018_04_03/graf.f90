PROGRAM graf

	IMPLICIT NONE

		REAL::a,b,h
		INTEGER::n,error
		CHARACTER(len=80)::nombre_archivo,mensaje_error

		print*,"Dame la región"
		read*,a,b
		print*,"Dame la cantidad de puntos a evaluar"
		read*,n
		print*,"Dame el nombre del archivo"
		read*,nombre_archivo

		!Cálculo de h
		h=(b-a)/n 

		OPEN(unit=3,file=nombre_archivo,status="unknown",&
			action="write",iostat=error,iomsg=mensaje_error)

			if ( error == 0 ) then
				call escritura_datos(a,n,h)
			
			else
				print*,mensaje_error
			endif
		CLOSE(3)

END PROGRAM

