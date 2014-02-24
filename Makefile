
lexpart: chords.l
	lex chords.l 

yaccpart: chords.y
	yacc -d chords.y

gccpart: yaccpart lexpart
	gcc y.tab.c lex.yy.c -o chords

execpart: a.out lex.yy.c chords.lex
	./a.out < jeu_de_test.txt

archive: chords.l chords.y Makefile jdt.txt
	tar cvf brojet_als.tar chords.l chords.y Makefile jdt.txt
	gzip brojet_als.tar

clean:
	rm *.c *.h chords

all: gccpart
