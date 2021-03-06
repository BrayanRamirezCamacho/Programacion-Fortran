PROGRAM magnitudes
implicit none

real,dimension(3):: v1=[32,67,9], v2=[2,4,6], v3=[25,7,-1]
real:: mv1, mv2, mv3

print*, "La magnitud del vector velocidad v1=[32,67,9] es:"
mv1=sqrt(v1(1)*v1(1)+v1(2)*v1(2)+v1(3)*v1(3))
print*, mv1, "km/hr"

print*, "La magnitud del vector velocidad v2=[2,4,6] es:"
mv2=sqrt(v2(1)*v2(1)+v2(2)*v2(2)+v2(3)*v2(3))
print*, mv2, "km/hr"

print*, "La magnitud del vector velocidad v3=[25,7,-1] es:"
mv3=sqrt(v3(1)*v3(1)+v3(2)*v3(2)+v3(3)*v3(3))
print*, mv3, "km/hr"

END PROGRAM
