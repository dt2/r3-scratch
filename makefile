all: run-dll
#all: run-dll
#all: clean build-dll
#all: clean build run
#all: build run
#all: clean build
#all: clean
#all: build

ping:
	pwd
	
run-dll: miniclean build-dll
	#LD_LIBRARY_PATH=$(PWD)/make make/host ../local-scrapbook.r3
	make/host ../local-scrapbook.r3
	
miniclean:
	rm make/host || true
	rm make/libr3.so || true
	rm make/r3 || true
	
build-dll:
	mkdir -p make/objs
	make -C make lib host
	
run:
	cp -a make/r3 ../r3-child
	make -C ../ run-nk

build:
	make -C make | tee local-buildlog.txt
	
clean: cp-r3-make
	rm make/r3 || true
	make -C make make
	make -C make clean prep
	ls make
	
cp-r3-make:
	cp ../r3 make/r3-make

