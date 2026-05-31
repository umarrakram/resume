TEX     := Umar_Akram_iOS_Dev.tex
PDF     := $(TEX:.tex=.pdf)
PREVIEW := resume-preview.png

.PHONY: all pdf preview open watch clean distclean

all: pdf preview

pdf: $(PDF)

$(PDF): $(TEX)
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(TEX)

preview: $(PREVIEW)

$(PREVIEW): $(PDF)
	pdftoppm -png -r 150 -f 1 -l 1 -singlefile $(PDF) resume-preview

open: pdf
	open $(PDF)

watch:
	latexmk -pdf -pvc -interaction=nonstopmode $(TEX)

clean:
	latexmk -c
	rm -f *.aux *.log *.out *.synctex.gz *.fls *.fdb_latexmk *.toc

distclean: clean
	rm -f $(PDF) $(PREVIEW)
