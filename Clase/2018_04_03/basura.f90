PROGRAM basura

	IMPLICIT NONE
	
	INTEGER::error
	CHARACTER(len=80)::mensaje_error

	OPEN ( UNIT=5 , FILE="basura0" , STATUS="NEW" , IOSTAT=error , &
		IOMSG=mensaje_error , ACTION="WRITE")

		IF ( error == 0 ) THEN

			WRITE(5,*) "Hola a todos"
			WRITE(5,*) "Bienvenidos al curso de nuevo"

		ELSE
			PRINT*,mensaje_error
	
		END IF

	CLOSE(5)

END PROGRAM basura
