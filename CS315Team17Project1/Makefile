all: build run

build:
	lex noscript.l
	gcc -o noscript lex.yy.c

run:
	./noscript < test1.txt
	./noscript < test2.txt
	./noscript < test3.txt
	./noscript < pseudo1.txt
	./noscript < pseudo2.txt

clean:
	rm -f noscript
	rm -f lex.yy.c
	clear