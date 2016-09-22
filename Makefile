SOURCES = main.tex main.bib $(shell find chapters/ -type f)
IMAGES := $(shell find img/ -type f)
LISTINGS := $(shell find listings/ -type f)

main.pdf: $(SOURCES) $(IMAGES) $(LISTINGS)
	pdflatex -interactive=batchmode $<
	biber $(basename $@ .pdf)
	pdflatex -interactive=batchmode $<

.PHONY: all clean

all:	main.pdf

clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *.bcf *-blx.bib *.run.xml *.lof *.lol *.lot main.pdf
