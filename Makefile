CPPFLAGS=-I/usr/include/nodejs -D_FILE_OFFSET_BITS=64 
LDFLAGS=-L../libv8-3.8.9.20 -lv8

OBJS = llfuse4js.o

CC = g++

llfuse4js.node: llfuse4js.o
	g++ -shared -o llfuse4js.node llfuse4js.o -lfuse

llfuse4js.o: llfuse4js.cc
	$(CC) -o llfuse4js.o -c llfuse4js.cc $(CPPFLAGS) -fPIC

install:
	mkdir -p ~/.node_modules/llfuse4js/build/Release
	cp package.json ~/.node_modules/llfuse4js
	cp llfuse4js.node ~/.node_modules/llfuse4js/build/Release

clean:
	$(RM) llfuse4js.o llfuse4js.o llfuse4js.node
	rm -rf ~/.node_modules/llfuse4js
