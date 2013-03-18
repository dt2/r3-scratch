all: build
	make -C ../ run-nk

build:
	make -C make
	
clean:
	make -C make clean prep
