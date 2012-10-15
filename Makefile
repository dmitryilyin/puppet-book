pdf: 
	pdflatex tex/puppetbook.tex

all: pdf

rubber:
	rubber -d tex/puppetbook.tex

clean:
	rm -f *.ps *.pdf *.log *.aux *.out *.dvi *.bbl *.blg *.ilg *.ind *.idx *.toc
