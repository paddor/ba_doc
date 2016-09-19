SOURCES = ba.tex ba.bib
IMAGES := $(shell find img/ -type f)
LISTINGS := $(shell find listings/ -type f)

ba.pdf:	$(SOURCES) $(IMAGES) $(LISTINGS)
	pdflatex -interactive=batchmode $<
	biber $(basename $@ .pdf)
	pdflatex -interactive=batchmode $<

.PHONY: all clean

all:	ba.pdf

clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *.bcf *-blx.bib *.run.xml *.lof *.lol *.lot ba.pdf
