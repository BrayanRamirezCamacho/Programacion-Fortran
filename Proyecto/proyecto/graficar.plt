set xlabel "Posiciones en eje x"
set ylabel "Posiciones en eje y"
set zlabel "Tiempo"

plot "tierra" pt 7 ps 5 lc rgb "blue" title"Tierra", "luna" pt 7 ps 2 lc rgb "grey" title"Luna", "Trayectoria_nave" pt 7 ps 1 lc rgb "purple" title"Trayectoria de la nave"
set title "Trayectoira eliptica de la nave al rededor de la Tierra y la Luna."
plot "tierra" pt 7 ps 5 lc rgb "blue" title"Tierra", "luna" pt 7 ps 2 lc rgb "grey" title"Luna", "Trayectoria_nave" pt 7 ps 1 lc rgb "purple" title"Trayectoria de la nave"
set grid
plot "tierra" pt 7 ps 5 lc rgb "blue" title"Tierra", "luna" pt 7 ps 2 lc rgb "grey" title"Luna", "Trayectoria_nave" pt 7 ps 1 lc rgb "purple" title"Trayectoria de la nave"
set key right bottom
plot "tierra" pt 7 ps 5 lc rgb "blue" title"Tierra", "luna" pt 7 ps 2 lc rgb "grey" title"Luna", "Trayectoria_nave" pt 7 ps 1 lc rgb "purple" title"Trayectoria de la nave"
set term png
set output "Trayectoria_nave.png"
replot
quit
