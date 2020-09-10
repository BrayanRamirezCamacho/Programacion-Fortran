##
## Makefile
##  
## Made by Dupret Alberto Santana Bejarano
## Login   <dupretRhapsody>
##
## Started on  Tue Mar  6 01:01:51 2018 Dupret Alberto Santana Bejarano
## Last update Time-stamp: <06-mar-2018 01:06:32 dupret>
##
#
# This makefile is intended for the program 
#
#      MassFuntion

#===============================================
# Fortran Parameters
#===============================================
FC = gfortran #Compiler
FFLAGS = -O3  #Optimization Flags (maybe tinker with these?)
FSRC = series.f90 subr.f90 funcion1.f90 funcion2.f90 funcion3.f90
FOBJECTS = $(FSRC:.f90=.o) #Objets

#===============================================
# C Parameters
#===============================================
CC = gcc #Compiler
CFLAGS = -O   #-ffixed-line-length-132 #Optimization Flags (maybe tinker with these?)
CSRC = 
COBJECTS = $(CSRC:.c=.u) # C Objets 
CHEAD = 

#===============================================
# General Parameters.  
#===============================================
OBJECTS =	$(FOBJECTS) $(COBJECTS)
EXEC = series

#===============================================
# Compilation rules
#===============================================
default: $(EXEC)

clean:	
	rm -f *~ $(OBJECTS) *.pro *.ascii *.nat *.mod *.Gh

spotless:	
	rm -f *~ $(OBJECTS) $(EXEC)

$(EXEC): $(OBJECTS)
	$(FC) $(FFLAGS) $(FLFLAGS) -o $(EXEC) \
		 $(OBJECTS) -lm

%.o:  %.f90
	$(FC) $(FFLAGS) -c $< -o $@

%.u:	%.c $(CHEAD)	
	$(CC) $(CFLAGS) -c $< -o $@ 
