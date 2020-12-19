SOURCES=src/*.cpp
PCH_SOURCE=src/pch.h
CFLAGS=-std=c++20 -g -Wall
OUTFILE=a.out

.PHONY: all clean

all:
	make pch
	make build

pch: ${PCH_SOURCE}
	clang++ ${CFLAGS} -x c++-header ${PCH_SOURCE} -o ${PCH_SOURCE}.pch

build: ${PCH_SOURCE}.pch ${SOURCES}
	clang++ ${CFLAGS} -include-pch ${PCH_SOURCE}.pch ${SOURCES} -o ${OUTFILE}

clean:
	rm -f ${OUTFILE}
	rm -f ${PCH_SOURCE}.pch

