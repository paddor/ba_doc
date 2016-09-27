all:	task_description.pdf

task_description.pdf: task_description.tex refs.bib
	pdflatex $<
	biber $(basename $@ .pdf)
	pdflatex $<

.PHONY: all clean


clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *.bcf *-blx.bib *.run.xml task_description.pdf
