all:    cli
CC:=gcc
CPPFLAGS:=-g    -pthread
cli:cli.o
	$(CC)  $(CPPFLAGS) cli.o     -o   ./client/cli   
	$(CC)  $(CPPFLAGS) cli.o     -o   cli   
cli.o:cli.s
	$(CC)  $(CPPFLAGS)   -c	 cli.s -o  cli.o   
cli.s:cli.i
	$(CC)  $(CPPFLAGS)  -S   cli.i      -o  cli.s
cli.i:client.c
	$(CC)  $(CPPFLAGS) -E  client.c  -o  cli.i
clean:
	rm   *.o   *.i  *.s cli   
