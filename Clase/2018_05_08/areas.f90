MODULE areas

implicit none
	save
	integer,parameter::k=SELECTED_REAL_KIND(10,200)
	real(k),parameter::pi=3.14159
	real(k)::r,l,d,A,V


contains

!--------------------------------------------------------


subroutine esfera

V=(4./3.)*pi*r**3

A=4*pi*r**2

end subroutine

!--------------------------------------------------------

subroutine cuadrado

A=l**2

end subroutine cuadrado

!--------------------------------------------------------

subroutine circulo
 
A=pi*d**2   
    
end subroutine circulo

!--------------------------------------------------------


END MODULE
