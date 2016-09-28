SOURCES = task_description.tex refs.bib
IMAGES := $(shell find img/ -type f)

all:	task_description.pdf

task_description.pdf: $(SOURCES) $(IMAGES)
	pdflatex -interactive=batchmode $<
	biber $(basename $@ .pdf)
	pdflatex -interactive=batchmode $<

.PHONY: all clean


clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *.bcf *-blx.bib *.run.xml task_description.pdf
