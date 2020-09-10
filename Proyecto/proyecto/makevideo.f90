!
!! freefall.f08
!! 
!! Made by (Dupret Alberto Santana Bejarano)
!! Login   <dupret@Rhapsody>
!! 
!! Started on  Tue Feb 24 09:12:02 2015 Dupret Alberto Santana Bejarano
!! Last update Time-stamp: <2016-nov-03.jueves 12:09:11 (dupret)>
!

SUBROUTINE makevideo(pos1,pos2,pos3,tp,mn)

  USE mass_objects
  
  IMPLICIT NONE
  
  INTEGER:: i,unit0,j,mn,unit1=345678
  REAL ( d ) :: maxx,minx
  REAL ( d ) :: maxy,miny
  CHARACTER(len=9) :: name
  CHARACTER(len=4) :: indice
  REAL ( d ):: pos1 ( 1:3 , 1:mn )
  REAL ( d ):: pos2 ( 1:3 , 1:mn )
  REAL ( d ):: pos3 ( 1:3 , 1:mn )
  REAL ( d ) :: tp ( 1:mn )
  REAL ( d ), DIMENSION(1:3) :: valmaxx,valminx
  REAL ( d ), DIMENSION(1:3) :: valmaxy,valminy

  !DO i=1,mn
  !PRINT*, (pos1(i,j),j=1,3)
  !ENDDO

  PRINT*, MINVAL(pos1(1,:)), MINVAL(pos2(1,:)),MINVAL(pos3(1,:))
  valmaxx(1)= MAXVAL(pos1(1,:))
  valmaxx(2)= MAXVAL(pos2(1,:))
  valmaxx(3)= MAXVAL(pos3(1,:))
  valmaxy(1)= MAXVAL(pos1(2,:))
  valmaxy(2)= MAXVAL(pos2(2,:))
  valmaxy(3)= MAXVAL(pos3(2,:))
  valminx(1)= MINVAL(pos1(1,:))
  valminx(2)= MINVAL(pos2(1,:))
  valminx(3)= MINVAL(pos3(1,:))
  valminy(1)= MINVAL(pos1(2,:))
  valminy(2)= MINVAL(pos2(2,:))
  valminy(3)= MINVAL(pos3(2,:))

 ! PRINT*, valmaxx,valminx,valmaxy,valminy

  maxx = MAXVAL(valmaxx)
  minx = MAXVAL(valminx)
  maxy = MAXVAL(valmaxy)
  miny = MAXVAL(valminy)
  
  !PRINT*, maxx,minx,maxy,miny
   !PRINT*, maxx+3,minx-3,maxy+3,miny-3
  PRINT*, "Inicia construcción del video"

  DO i=1,mn
     IF(i<=9)THEN
        WRITE(indice,'(i1)') i
        name='proy.000'//indice
        OPEN(NEWUNIT=unit0, FILE=name, STATUS="UNKNOWN")
        IF(i==1)THEN
           WRITE(unit0,*) pos1(:,i),pos1(:,i),pos2(:,i),pos3(:,i),pos3(:,i)
        ELSE
        DO j=1,i-1
           WRITE(unit0,*) pos1(:,j),pos1(:,i),pos2(:,i),pos3(:,i),pos3(:,i)
        ENDDO
        END IF
        CLOSE(unit0)
        OPEN(unit1, FILE="script.gnu", STATUS="UNKNOWN",ACCESS&
             &="APPEND")
        WRITE(unit1,*) 'set xrange[',MINVAL(valminx)-3._d,':',MAXVAL(valmaxx)+3._d,']'
        WRITE(unit1,*) 'set yrange[',MINVAL(valminy)-3._d,':',MAXVAL(valmaxy)+3._d,']'
        !WRITE(unit1,*) 'set arrow from',MINVAL(x),',',MINVAL(y), 'to', MINVAL(x),',',MAXVAL(y)+2,'nohead'
        WRITE(unit1,*) 'set grid'
        WRITE(unit1,*) 'set xzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set yzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set label 1 "X(l0)" at graph 0.5,0.1 center'
        WRITE(unit1,*) 'set label 2 "Y(l0)" at graph 0.05,0.5 center'
        WRITE(unit1,*) 'plot ', '"'//name//'"',' using 1:2 with dots title "t=',tp(i),'t0",'&
             &,'"'//name//'"', ' using 4:5 with points pt 9 ps 2 notitle,'&
             &,'"'//name//'"',' using 7:8 with points pt 7 ps 5 notitle,'&
             &,'"'//name//'"', ' using 10:11 with points pt 7 ps 3 notitle'
        WRITE(unit1,*) "set term png"
        WRITE(unit1,*) "set output ", '"'//name//'.png'//'"'
        WRITE(unit1,*) "replot"
     ELSE IF(i>9 .AND. i<=99)THEN
        WRITE(indice,'(i2)') i
        name='proy.00'//indice
        OPEN(NEWUNIT=unit0, FILE=name, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) pos1(:,j),pos1(:,i),pos2(:,i),pos3(:,i),pos3(:,i)
        ENDDO
        CLOSE(unit0)
        OPEN(unit1, FILE="script.gnu", STATUS="UNKNOWN",ACCESS&
             &="APPEND")
        WRITE(unit1,*) 'set xrange[',MINVAL(valminx)-3._d,':',MAXVAL(valmaxx)+3._d,']'
        WRITE(unit1,*) 'set yrange[',MINVAL(valminy)-3._d,':',MAXVAL(valmaxy)+3._d,']'
        !WRITE(unit1,*) 'set arrow from',MINVAL(x),',',MINVAL(y), 'to', MINVAL(x),',',MAXVAL(y)+2,'nohead'
        WRITE(unit1,*) 'set grid'
        WRITE(unit1,*) 'set xzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set yzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set label 1 "X(l0)" at graph 0.5,0.1 center'
        WRITE(unit1,*) 'set label 2 "Y(l0)" at graph 0.05,0.5 center'
        WRITE(unit1,*) 'plot ', '"'//name//'"',' using 1:2 with dots title "t=',tp(i),'t0",'&
             &,'"'//name//'"', ' using 4:5 with points pt 9 ps 2 notitle,'&
             &,'"'//name//'"',' using 7:8 with points pt 7 ps 5 notitle,'&
             &,'"'//name//'"', ' using 10:11 with points pt 7 ps 3 notitle'
        WRITE(unit1,*) "set term png"
        WRITE(unit1,*) "set output ", '"'//name//'.png'//'"'
        WRITE(unit1,*) "replot"
        
     ELSE IF(i>9 .AND. i<=999)THEN
        WRITE(indice,'(i3)') i
        name='proy.0'//indice
        OPEN(NEWUNIT=unit0, FILE=name, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) pos1(:,j),pos1(:,i),pos2(:,i),pos3(:,i),pos3(:,i)
        ENDDO
        CLOSE(unit0)
        OPEN(unit1, FILE="script.gnu", STATUS="UNKNOWN",ACCESS&
             &="APPEND")
        WRITE(unit1,*) 'set xrange[',MINVAL(valminx)-3._d,':',MAXVAL(valmaxx)+3._d,']'
        WRITE(unit1,*) 'set yrange[',MINVAL(valminy)-3._d,':',MAXVAL(valmaxy)+3._d,']'
        !WRITE(unit1,*) 'set arrow from',MINVAL(x),',',MINVAL(y), 'to', MINVAL(x),',',MAXVAL(y)+2,'nohead'
        WRITE(unit1,*) 'set grid'
        WRITE(unit1,*) 'set xzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set yzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set label 1 "X(l0)" at graph 0.5,0.1 center'
        WRITE(unit1,*) 'set label 2 "Y(l0)" at graph 0.05,0.5 center'
        WRITE(unit1,*) 'plot ', '"'//name//'"',' using 1:2 with dots title "t=',tp(i),'t0",'&
             &,'"'//name//'"', ' using 4:5 with points pt 9 ps 2 notitle,'&
             &,'"'//name//'"',' using 7:8 with points pt 7 ps 5 notitle,'&
             &,'"'//name//'"', ' using 10:11 with points pt 7 ps 3 notitle'
        WRITE(unit1,*) "set term png"
        WRITE(unit1,*) "set output ", '"'//name//'.png'//'"'
        WRITE(unit1,*) "replot"

     ELSE IF(i>=1000)THEN
        WRITE(indice,'(i4)') i
        name='proy.'//indice
        OPEN(NEWUNIT=unit0, FILE=name, STATUS="UNKNOWN")
        DO j=1,i-1
           WRITE(unit0,*) pos1(:,j),pos1(:,i),pos2(:,i),pos3(:,i),pos3(:,i)
        ENDDO
        CLOSE(unit0)
        OPEN(unit1, FILE="script.gnu", STATUS="UNKNOWN",ACCESS&
             &="APPEND")
        WRITE(unit1,*) 'set xrange[',MINVAL(valminx)-3._d,':',MAXVAL(valmaxx)+3._d,']'
        WRITE(unit1,*) 'set yrange[',MINVAL(valminy)-3._d,':',MAXVAL(valmaxy)+3._d,']'
        !WRITE(unit1,*) 'set arrow from',MINVAL(x),',',MINVAL(y), 'to', MINVAL(x),',',MAXVAL(y)+2,'nohead'
        WRITE(unit1,*) 'set grid'
        WRITE(unit1,*) 'set xzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set yzeroaxis linetype 3 linewidth 2.5'
        WRITE(unit1,*) 'set label 1 "X(l0)" at graph 0.5,0.1 center'
        WRITE(unit1,*) 'set label 2 "Y(l0)" at graph 0.05,0.5 center'
        WRITE(unit1,*) 'plot ', '"'//name//'"',' using 1:2 with dots title "t=',tp(i),'t0",'&
             &,'"'//name//'"', ' using 4:5 with points pt 9 ps 2 notitle,'&
             &,'"'//name//'"',' using 7:8 with points pt 7 ps 5 notitle,'&
             &,'"'//name//'"', ' using 10:11 with points pt 7 ps 3 notitle'
        WRITE(unit1,*) "set term png"
        WRITE(unit1,*) "set output ", '"'//name//'.png'//'"'
        WRITE(unit1,*) "replot"
        
     ENDIF
  ENDDO
  WRITE(unit1,*) "exit"
  CLOSE(unit1)
  
  CALL EXECUTE_COMMAND_LINE("gnuplot script.gnu")
  CALL EXECUTE_COMMAND_LINE('mencoder mf://*.png -mf w=800:h=600:fps=50:type=png -ovc copy -oac copy -o video.avi'  )
  CALL EXECUTE_COMMAND_LINE("rm proy.*")
  CALL EXECUTE_COMMAND_LINE("rm *.gnu")




  
END SUBROUTINE makevideo
