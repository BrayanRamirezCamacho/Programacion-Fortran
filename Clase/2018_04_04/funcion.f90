function f(x0)
    implicit none
    real :: f
    real,intent(in)::x0

    f=4*sin(x0**2)
    
end function f  