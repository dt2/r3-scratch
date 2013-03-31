#all: clean build run
all: build run
#all: clean build
#all: clean
#all: build

run:
	cp -a make/r3 ../r3-child
	make -C ../ run-nk

build:
	make -C make | tee local-buildlog.txt
	
clean: cp-r3-make
	make -C make make
	rm make/r3
	make -C make clean prep
	
cp-r3-make: build
	cp ../r3 make/r3-make

