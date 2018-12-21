default:
	@echo "Usage: make [covert|compile|run|all]"
convert:
	cython -a compute.pyx
compile:
	gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python3.5m -o compute.so compute.c
run:
	python3 run.py --sigma 3.0 ./christmas.jpg ./christmas.out.jpg
run-fast:
	python3 run.py --no_separable_filters --sigma 3.0 ./christmas.jpg ./christmas.out.jpg
all: convert compile run
print-%: ; @echo $*=$($*)

