# $Id: makefile 243 2024-04-06 10:34:40Z rishi $

file=JET_PlasmaControlSystemUpgradeUsingMARTe2


all: pdf out nomen
	make pdf
	make pdf

out:
	if  [ -f $(file).out ] ; then cp $(file).out tmp.out; fi ;
	sed 's/BOOKMARK/dtxmark/g;' tmp.out > x.out; mv x.out tmp.out ;

pdf:
	pdflatex $(file).tex

index:
	makeindex -s gind.ist -o $(file).ind $(file).idx 

changes:
	makeindex -s nomencl.ist -o $(file).gls $(file).glo

nomen:
	makeindex $(file).nlo -s nomencl.ist -o $(file).nls 

xview:
#	xpdf -z 200 $(file).pdf &>/dev/null
	open -a 'Skim.app' $(file).pdf 

view:
	open -a 'Adobe Reader.app' $(file).pdf

ins:
	latex $(file).ins 

diff:
	diff $(file).sty ../$(file).sty |less

copy:
	cp $(file).sty ../

