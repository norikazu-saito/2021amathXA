# for cd2d-1.edp
clear
reset
set pm3d
#set palette rgbformulae 33,13,10
set ticslevel 0
set view 38,24
unset colorbox
splot "cd2d-1.plt" title "" w l pal
set terminal pdf
set output "cd2d-1.pdf"
replot
set terminal qt



