!--------------------------------------------------------
!Esta subrutina calcula las
!Además, convierte las unidades del ángulo de grados a
!radianes.
!--------------------------------------------------------

subroutine tiro(v_0,theta,x_0,y_0,n)

!Declaración de variables
	implicit none
	real,parameter::pi=3.14159265359,g=9.80665
	real::v_0,theta,x_0,y_0,t_total,t_total1,t_total2
	real::v_0x,v_0y,t_total,t_total1,t_total2

!Conversion de theta de grados a radianes
theta=theta*(180/pi)

!Cálculo de las componentes de la velocidad
v_0x=v_0*cos(theta)
v_0y=v_0*sin(theta)

!Cálculo del tiempo total, utilizando la ecuación
!Y(t)=(y_0)+(v_0y)t+(-g/2)t², sabiendo que 
!Y(t_total)=0
!por lo tanto
!(-g/2)t²+(v_0y)t+(y_0)=0
!(at²+bt+c=0)

!Usando la fórmula general
t_total1=((-v_0y)+sqrt((v_0y)**2-4*(-g/2)*y_0))/(-g)
t_total2=((-v_0y)-sqrt((v_0y)**2-4*(-g/2)*y_0))/(-g)

!Tomando sólo el tiempo con valor positivo
if (t_total1>0) then
	t_total=t_total1
else
	t_total=t_total2
endif

!Calculando el ancho de paso, h 
h=t_total/n 


!Aquí se llena el arreglo con los datos de tiempo y
!posiciones en x y en y

do i=1,n 

	tiempos(i)=i*h
	X(i)=x_0+v_0x*tiempos(i)
	Y(i)=y_0+v_0y*tiempos(i)+(-g/2)*(tiempos(i))**2

end do

call llenar()

end subroutine
