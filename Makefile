# makefile : builds ehsim program

# compile options
FC = gfortran
FCFLAGS = 
FLIBS = 
LPATH = 
OBJS = numerical.o
MAIN = ehsim.f90

# main program instructions
ehsim : $(MAIN) $(OBJS)
	$(FC) $(FCFLAGS) $(LPATH) -o $@ $^ $(FLIBS)

# compile object files here
%.o : %.f90
	$(FC) $(FCFLAGS) -c $< $(FLIBS)

clean :
	rm ehsim *.o
