SHELL := /bin/bash
LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
ifeq ($(LATEXMK_VERSION),4.24)
	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf
else
	LATEXMK_OPTIONS=-xelatex
endif

presentation.pdf: presentation.tex dragonfly.sty pattern.eps logo.eps
	latexmk $(LATEXMK_OPTIONS) presentation.tex

letter.pdf: letter.tex dragonfly.sty logo.eps
	latexmk $(LATEXMK_OPTIONS) letter.tex

all: dragonfly.pdf letter.pdf presentation.pdf

dragonfly.sty: dragonfly.ins dragonfly.dtx 
	latex dragonfly.ins

dragonfly.pdf: dragonfly.dtx dragonfly.sty
	latexmk $(LATEXMK_OPTIONS) dragonfly.dtx

example.tex: example.md
	pandoc --read markdown_github+footnotes+all_symbols_escapable \
		   --to latex $< \
		   | sed '/\\itemsep1pt/d' > $@

pkg:
	debuild -us -uc

.PHONY: cleanClass clean

cleanClass:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls \
		dragonfly-article.cls dragonfly.pdf

clean: cleanClass
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls

