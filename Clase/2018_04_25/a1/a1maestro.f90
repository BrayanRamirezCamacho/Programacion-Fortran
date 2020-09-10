!-----------------------------------------------------------
!Este programa funciona para ordenar números ascendente o 
!descendentemente, esto lo elige el usuario.
!
!El usuario escoge si los datos se ingresan desde el teclado
!o desde un archivo de texto.
!
!Utiliza el algoritmo de Comb Sort para ordenar los números.
!
!-----------------------------------------------------------

PROGRAM ordmaestro

implicit none
integer::opcion,orden


print*,"Hola, usuario, éste programa ordena números de"
print*,"manera ascendente o descendente."
print*,"¿Quiere ingresar los datos desde el teclado"
print*,"o desde un archivo de texto?"
print*,"Si desea lo primero, presione 1."
print*,"Si desea lo segundo, presione 2."
read*,opcion
print*,"Ahora, ¿quiere ordenar los números ascendente o"
print*,"descendentemente?"
print*,"Si desea lo primero, presione 1."
print*,"Si desea lo segundo, presione 2."
read*,orden


!Opción: ingresar datos desde el teclado.
if ( opcion == 1 ) then

	!Opción: ordenar los numeros ascendentemente
	if ( orden == 1 ) then

	!Opción: ordenar los numeros descendentemente
	if ( orden == 2 ) then

	else
	print*,"Escoga una de las opciones disponibles."

	end if 


!Opción: ingresar datos desde un archivo de texto.
if ( opcion == 2 ) then

	!Opción: ordenar los numeros ascendentemente
	if ( orden == 1 ) then

	!Opción: ordenar los numeros descendentemente
	if ( orden == 2 ) then

	else
	print*,"Escoga una de las opciones disponibles."

	end if

else
	print*,"Escoga una de las opciones disponibles."

end if


END PROGRAM