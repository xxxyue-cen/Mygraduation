all:ser    cli
CC:=gcc
CPPFLAGS:=-g    -pthread
ser:ser.o
	$(CC)  $(CPPFLAGS) ser.o     -o  ./server/ser    -lmysqlclient 
	$(CC)  $(CPPFLAGS) ser.o     -o  ser    -lmysqlclient
ser.o:ser.s
	$(CC)  $(CPPFLAGS)   -c   ser.s    -o     ser.o   -lmysqlclient 
ser.s:ser.i
	$(CC)  $(CPPFLAGS)   -S   ser.i    -o    ser.s
ser.i:server.c
	$(CC)  $(CPPFLAGS)   -E   server.c  -o  ser.i
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
	rm   *.o   *.i  *.s cli  ser 
