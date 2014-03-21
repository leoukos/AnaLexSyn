AnaLexSyn
=========

Analyse lexicale et syntaxique

Use the Makefile to build the project using this command : make gccpart
Then you can use the script "run.sh" to execute the program on a source file
and generate the pdf automaticaly. Use this command : ./run.sh <your_source_file.txt>

An example of source file is given in jdt.txt.

For example you can do :
make gccpart
./run.sh jdt.txt

The file jdt.pdf contains your final output.


* Some build will not work
* In that case you will need to edit the "y.tab.h" file
* Change the type definition of from "int" to "char*"
