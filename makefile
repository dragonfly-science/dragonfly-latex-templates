SHELL := /bin/bash
PREFIX := TEXINPUTS=.///:
LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
ifeq ($(LATEXMK_VERSION),4.24)
	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf -e '$$biber = q/.\/biber %B/'
else
	LATEXMK_OPTIONS=-xelatex
endif

all: dragonfly.pdf letter.pdf presentation.pdf article.pdf report.pdf proposal.pdf aebr.pdf mpi-far.pdf

aebr.pdf: aebr.tex test.bib dragonfly.sty AEBR.jpg biblatex-mfish/mfish.bbx biblatex-mfish/mfish.cbx biblatex-mfish/english-mfish.lbx
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) aebr.tex

mpi-far.pdf: mpi-far.tex test.bib dragonfly.sty FAR.jpg biblatex-mfish/mfish.bbx biblatex-mfish/mfish.cbx biblatex-mfish/english-mfish.lbx
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) mpi-far.tex

report.pdf: report.tex test.bib dragonfly.sty wallpaper.png logo.eps biblatex-mfish/mfish.bbx biblatex-mfish/mfish.cbx biblatex-mfish/english-mfish.lbx
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) report.tex

proposal.pdf: proposal.tex dragonfly.sty wallpaper.png logo.eps
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) proposal.tex

article.pdf: article.tex dragonfly.sty
	latexmk $(LATEXMK_OPTIONS) article.tex

presentation.pdf: presentation.tex dragonfly.sty pattern.eps logo.eps
	latexmk $(LATEXMK_OPTIONS) presentation.tex

letter.pdf: letter.tex dragonfly.sty logo.eps
	latexmk $(LATEXMK_OPTIONS) letter.tex

dragonfly.sty: dragonfly.ins dragonfly.dtx 
	latex dragonfly.ins

dragonfly.pdf: dragonfly.dtx dragonfly.sty
	latexmk $(LATEXMK_OPTIONS) dragonfly.dtx

pkg:
	debuild -us -uc

.PHONY: cleanClass clean

cleanClass:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls \
		dragonfly-article.cls dragonfly-proposal.cls dragonfly.pdf \
		mpi-far.cls aebr.cls

clean: cleanClass
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls *-self.bib *.toc *.snm *.nav \
		 *.ilg *-blx.bib *.run.xml *.bbl *.ind *.blg *.bcf \
		 *.xwm

