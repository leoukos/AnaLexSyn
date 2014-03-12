#! /bin/bash

NAME=`basename -s ".txt" $1`

make gccpart
./chords < $NAME.txt > $NAME.tex
pdflatex $NAME.tex
xpdf $NAME.pdf


exit 0
