all: build

build: dirs main
	@echo "building executables from object files:"
	g++ build/main.o -o bin/main
	ln -sf bin/main main

debug: dirs
	@echo "generating object file with debug symbols:"
	g++ src/main.cpp -g -c -o build/main.o

	@echo "building executables from object files:"
	g++ build/main.o -o bin/main
	ln -sf bin/main main

dirs:
	@echo "Creating dirs:"
	mkdir -p build/
	mkdir -p bin/
	mkdir -p debug/

main:
	@echo "generating object file main.o:"
	g++ src/main.cpp -c -o build/main.o

clean:
	@echo "cleaning up:"
	rm -rf main \
	       build/ bin/ debug/
