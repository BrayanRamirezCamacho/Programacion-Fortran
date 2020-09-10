!!Este modulo es para hacer algunas operaciones de vectores que
!!pueden ser de utilidad

MODULE vector_functions

	USE mass_objects

	IMPLICIT NONE

CONTAINS

	!!Esta función sirve para rellenar los elementos del arreglo sin
	!!declaración explı́cita de los ı́ndices.

	FUNCTION vector ( x0 , y0 , z0 )
	
		IMPLICIT NONE

		REAL ( d ) :: x0 , y0 , z0
		REAL ( d ) , DIMENSION ( 3 ) :: vector

		vector ( 1 ) = x0
		vector ( 2 ) = y0
		vector ( 3 ) = z0

	END FUNCTION vector

	!!Función construida para calcular la magnitud de un vector de 3D

	FUNCTION mag ( x0 )

		IMPLICIT NONE
		
		REAL ( d ) , DIMENSION ( 3 ) :: x0
		REAL ( d ) :: mag

		mag = SQRT ( x0 ( 1 ) ** 2 + x0 ( 2 ) ** 2 + x0 ( 3 ) **2 )

	END FUNCTION mag

END MODULE vector_functions
