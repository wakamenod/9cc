CFLAGS=-std=c11	-g	-static
PRDIR=${HOME}/Projects/CProjects/9cc

9cc:
	docker run --rm -v ${PRDIR}/9cc:/9cc -w /9cc compilerbook cc -o	9cc	9cc.c

run:	9cc
	docker run --rm -v ${PRDIR}/9cc:/9cc -w /9cc compilerbook ./9cc 199 > tmp.s

test:	9cc
	docker run --rm -v ${PRDIR}/9cc:/9cc -w /9cc compilerbook ./test.sh

clean:
		rm -f 9cc *.o *~ tmp*

.PHONY:	test clean
