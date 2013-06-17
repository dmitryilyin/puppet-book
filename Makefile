pdf: 
	pdflatex puppetbook.tex

all: pdf

rubber:
	rubber -d puppetbook.tex

clean:
	rm -f *.ps *.pdf *.log *.aux *.out *.dvi *.bbl *.blg *.ilg *.ind *.idx *.toc *.fls *.fdb_latexmk
