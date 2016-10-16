SOURCES = main.tex main.bib $(shell find . -depth 1 -name '*.tex' -type f)
IMAGES := $(shell find img/ -type f)
LISTINGS := $(shell find listings/ -type f)

main.pdf: $(SOURCES) $(IMAGES) $(LISTINGS)
	pdflatex -interactive=batchmode -shell-escape $<
	biber $(basename $@ .pdf)
	rm *.glsdefs # allow incremental updates to the glossary entries
	makeglossaries $(basename $@ .pdf)
	pdflatex -interactive=batchmode -shell-escape $<

.PHONY: all clean

all:	main.pdf

clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *.bcf *-blx.bib *.run.xml *.lof *.lol *.lot *.glg *.glo *.gls *.glsdefs *.xdy main.pdf
