CFLAGS=-std=c11	-g	-static
PRDIR=${HOME}/Projects/CProjects/9cc
DRUN=docker run --rm -v ${PRDIR}/9cc:/9cc -w /9cc compilerbook /bin/bash -c

9cc:
	${DRUN} 'cc -o 9cc 9cc.c'

run:	9cc
	${DRUN} ./9cc 199 > tmp.s

tmp:
	${DRUN}	'cc -o tmp tmp.s; ./tmp; echo "$$?"'

test:	9cc
	${DRUN} ./test.sh

clean:
		rm -f 9cc *.o *~ tmp*

.PHONY:	test clean
