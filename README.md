AnaLexSyn
=========

Analyse lexicale et syntaxique

Use the Makefile to build the project using this command : make gccpart
Then you can use the script "run.sh" to execute the program on a source file
and generate the pdf automaticaly. Use this command : ./run.sh <your_source_file.txt>

* Some build will not work
* In that case you will need to edit the "y.tab.h" file
* Change the type definition of from "int" to "char*"
