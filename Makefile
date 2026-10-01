.PHONY: all
all: build/05-main

build/00-main.c: main.c
	@cp $< $@

build/01-main.i: build/00-main.c
	@mkdir -p build
	clang -O0 -E $< -o $@

build/02-main.ll: build/01-main.i
	clang -O0 -emit-llvm -S $< -o $@

build/03-main.s: build/02-main.ll
	clang -O0 -S $< -o $@

build/04-main.o: build/03-main.s
	clang -c $< -o $@

build/05-main: build/04-main.o
	clang -O0 $< -o $@
