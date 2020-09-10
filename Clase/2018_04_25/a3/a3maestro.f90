!-------------------------------------------------------
!Este programa describe el movimiento de un proyectil.
!El usuario escribe los valores de la velocidad inicial,
!el ángulo de lanzamiento y las coordenadas de X y Y
!de la posición inicial.
!
!El programa hace los calculos mediante una subrutina.
!-------------------------------------------------------


program a3maestro

!Declaración de variables
	implicit none
		real::v_0,theta,x_0,y_0,t_total,t_total1,t_total2
		real,allocatable::tiempos(:)
		integer::i,n,error 
		real::h
		character::m_error

!Aquí se le piden al usuario las condiciones iniciales
print*,"Hola, usuario, este programa describe el movimiento"
print*,"de un proyectil. Por favor introduzca el valor de:"
print*,"La velocidad inicial, v_0:"
read*,v_0
print*,"El ángulo de lanzamiento, theta (en grados):"
read*,theta
print*,"Y por último, las posiciones iniciales en X:"
read*,x_0
print*,"y en Y:"
read*,y_0
print*,"Por último, escriba el número de particiones del"
print*,"tiempo total:"
read*,n 


call tiro(v_0,theta,x_0,y_0,n)


!------------------------------------------------------
T=[i*h,i=1,n]


do i=1,n

X(i)=x_o+v_0x*T(i)

		do j=1,n

			Y(j)=y_0+v_0y*T(i)+(-g/2)*T(j)**2

		end do

end do 
!------------------------------------------------------
    
end program a3maestro