PROGRAM Decaimiento_Radioactivo
!------------------------------------------------------------------------------
!Este programa calcula la cantidad de substancia radioactiva que
!permanece despues de un tiempo especifico, dada la cantidad inicial y su
!vida media. Las variables usadas son:
!    InitialAmount   : cantidad inicial de substancia (mg)
!    HalfLife        : vida media de la substancia (dias)
!    Time            : tiempo al cual se calcula la cantidad remanente (dias)
!    AmountRemaining : cantidad remanente de substancia (mg)
!
!Entrada:   InitialAmount, HalfLife, Time
!Salida:    AmountRemaining
!------------------------------------------------------------------------------

IMPLICIT NONE 

REAL :: InitialAmount, AmountRemaining
Integer :: HalfLife, Time

!Obtener los valores para InitialAmount, HalfLife y Time

PRINT *, "Escribe la cantidad inicial de substancia (mg), su vida media (dias)"
PRINT *, "y el tiempo (dias) a la cual se desea calcular la cantidad remanente:"
READ *, InitialAmount, HalfLife, Time

!Calcular la cantidad remanente al tiempo especificado.
AmountRemaining = InitialAmount * 0.5 ** (Time / HalfLife)

!Despliega en pantalla la cantidad remanente, AmountRemaining
PRINT *, "La cantidad remanente es: ", AmountRemaining, "mg"

END PROGRAM Decaimiento_Radioactivo
