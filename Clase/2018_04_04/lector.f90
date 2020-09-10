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
			read (4,*)x,y
		
			i=i+1
			print*,i,x,y
		end do

	else
		print*,mensaje_error

	endif

	close(4)

END PROGRAM lector