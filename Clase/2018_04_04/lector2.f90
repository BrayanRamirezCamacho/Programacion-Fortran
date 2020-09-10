PROGRAM lector

	IMPLICIT NONE

	REAL::x,y
	INTEGER::i,error
	CHARACTER(len=80)::nombre_archivo,mensaje_error

	print*,"Dame el nombre del archivo a leer."
	read*,nombre_archivo
	open(unit=4,file=nombre_archivo,status="old",&
		action="read",iostat=error,iomsg=mensaje_error)

	if ( error == 0 ) then
		i=0
		do
			read (4,*,iostat=error,iomsg=mensaje_error)x,y
			if ( error /= 0 ) exit
			i=i+1
			print*,i,x,y
		end do

		if (error > 0) then
		 	print*,mensaje_error,error
		else
			print*,"Fin del archivo",error
		endif 

	else
		print*,mensaje_error

	endif

	close(4)

END PROGRAM lector