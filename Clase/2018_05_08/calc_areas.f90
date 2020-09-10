program calc_areas

use areas

implicit none
	integer::opcion

print*,"¿Qué desea calcular?"
print*,"Las opciones son el area de un círculo (1)," 
print*, "de un cuadrado (2),"
print*,"o el volumen (3) o área de una esfera (4)."
read*,opcion

select case(opcion)

case(1) !Círculo 
print*,"Escriba el radio del círculo:"
read*,d
call circulo
print*,"El área es:"
print*,A


case(2) !Cuadrado 
print*,"Escriba el lado de su cuadrado:"
read*,l
call cuadrado
print*,"El área es:"
print*,A

case(3) !Esfera, área
print*,"Escriba el radio de su esfera:"
read*,r
call esfera
print*,"El volumen es:"
print*, V 


case(4) !Esfera, área
print*,"Escriba el radio de su esfera:"
read*,r  
call esfera
print*,"El área es:"
print*,A

end select 


end program calc_areas