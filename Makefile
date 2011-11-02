# Makefile for demo Software
#
# To run the makefile, type "make"
#
# To learn more about makefiles, see the info under uwinfo:
#	 uwinfo / facilities / computers / supported software / unix
# or read the man pages
#


### User Modifiable Macros ###
#
# CC represents the compiler, LINK represents the linker
# CFLAGS represents the compiler command line parameters
# 	-c means compile only, i.e. create an object file
#	-g means add symbol table information for debugging purposes
# LNFLAGS represents the linker command line parameters
#
CC = gcc
CFLAGS = -c -g
LINK = gcc
LNFLAGS = -g


### Program list ###
##  list all of the executables to be created with the makefile



# default target: create all of the programs listed
#
all:	kernal keyboard crt

#   programs
#   these commands link the object files and libraries into executables 

kernal:kernal.o 
	$(LINK) $(LNFLAGS) -o $@ kernal.o -lrt
		
keyboard: keyboard.o 
	$(LINK) $(LNFLAGS) -o $@ keyboard.o -lrt

crt: crt.o
	$(LINK) $(LNFLAGS) -o $@ crt.o -lrt

# compile the source code into object files

kernal.o: kernal.c kernal.h
	$(CC) $(CFLAGS) kernal.c

keyboard.o: keyboard.c kernal.h
	$(CC) $(CFLAGS) keyboard.c 

crt.o: crt.c kernal.h
	$(CC) $(CFLAGS) crt.c
