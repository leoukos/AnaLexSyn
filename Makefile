lexpart: chords.l
	lex chords.l 

yaccpart: chords.y
	yacc -d chords.y

gccpart: yaccpart lexpart utils.c utils.h
	gcc y.tab.c lex.yy.c utils.c -o chords

execpart: gccpart chords jdt.txt
	./chords < jdt.txt > chords.tex

latex : execpart chords.tex
	pdflatex chords.tex 

pdf: latex chords.pdf
	xpdf chords.pdf

archive: chords.l chords.y Makefile jdt.txt
	tar cvf brojet_als.tar chords.l chords.y Makefile jdt.txt
	gzip brojet_als.tar

clean:
#rm *.c *.h *.aux *.log *.out chords

