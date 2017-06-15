IMAGE := docker.dragonfly.co.nz/texlive-17.04:2017-06-15

RUN ?= docker run -it --rm --net=host --user=$$(id -u):$$(id -g) -e RUN= -v$$(pwd):/work -w /work $(IMAGE)

#SHELL := /bin/bash
#PREFIX := TEXINPUTS=.///:
#LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
#ifeq ($(LATEXMK_VERSION),4.24)
#	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf
#else
#	LATEXMK_OPTIONS=-xelatex
#endif
#
all: dragonfly.pdf \
	examples/letter.pdf \
	examples/presentation.pdf \
	examples/article.pdf \
	examples/report.pdf \
	examples/proposal.pdf

examples/report.pdf: examples/report.tex examples/test.bib dragonfly.sty wallpaper.png logo.eps
	(cd examples/build && $(RUN) xelatex ../report && $(RUN) biber ../report && $(RUN) xelatex ../report && mv report.pdf ..)

examples/%.pdf: examples/%.tex dragonfly.sty wallpaper.png logo.eps
	(cd examples/build && $(RUN) xelatex ../$* && mv $*.pdf ..)

dragonfly.sty: dragonfly.ins dragonfly.dtx
	$(RUN) latex dragonfly.ins

dragonfly.pdf: dragonfly.dtx dragonfly.sty
	$(RUN) latexmk -xelatex dragonfly.dtx

pkg:
	$(RUN) debuild -us -uc

.PHONY: cleanClass clean

cleanClass:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls \
		dragonfly-article.cls dragonfly-proposal.cls dragonfly.pdf

clean: cleanClass
	rm -f  examples/*.pdf examples/*
