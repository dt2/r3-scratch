#all: run-dll
#all: run-dll
#all: clean build-dll
#all: clean build run
#all: build run
#all: clean build
#all: clean
#all: build
all: build-andro

build-andro: miniclean
	cd make && make make OS_ID=0.4.3
	cat make/makefile
	cd make && make clean prep
	
	cd make && \
	INCL=~/android-ndk-r8e/platforms/android-14/arch-arm/usr/include \
	TOOLS=~/android-ndk-r8e/toolchains/arm-linux-androideabi-4.7/prebuilt/linux-x86/bin/arm-linux-androideabi- \
	make &&\
	ls -l
	#make -C make | tee local-buildlog.txt
	
make0:
	#make -C make make
	#$(REBOL) $T/make-make.r $(OS_ID)
	cd make && ./r3-make ../src/tools/make-make.r
	

clean: miniclean make0 cp-r3-make
	make -C make clean prep
	ls make
	
run-dll: miniclean build-dll
	#LD_LIBRARY_PATH=$(PWD)/make make/host ../local-scrapbook.r3
	set|grep ^PATH=
	set|grep LD_LIBRARY_PATH || true # nothing :)
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
	
cp-r3-make:
	cp ../r3 make/r3-make

