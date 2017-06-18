IMAGE := docker.dragonfly.co.nz/texlive-17.04:2017-06-16

TEXINPUTS := .///:..//latex//:..//graphics//:
RUN ?= docker run -it --rm --net=host --user=$$(id -u):$$(id -g) -e RUN= -e TEXINPUTS=$(TEXINPUTS) -v$$(pwd):/work -w /work $(IMAGE)

#SHELL := /bin/bash
#LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
#ifeq ($(LATEXMK_VERSION),4.24)
#	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf
#else
#	LATEXMK_OPTIONS=-xelatex
#endif
#
all: package/.build

examples/report.pdf: examples/report.tex examples/test.bib latex/dragonfly.sty graphics/wallpaper.png graphics/logo.eps
	$(RUN) bash -c "cd examples && xelatex report && biber report && xelatex report"

examples/%.pdf: examples/%.tex latex/dragonfly.sty graphics/wallpaper.png graphics/logo.eps
	$(RUN) bash -c "cd examples && xelatex $*"

latex/dragonfly.sty: latex/dragonfly.ins
	$(RUN) bash -c "cd latex && latex dragonfly.ins"

latex/dragonfly.pdf: latex/dragonfly.dtx latex/dragonfly.sty
	$(RUN) bash -c "cd latex && xelatex dragonfly.dtx"

.PRECIOUS: package/.build
package/.build: latex/dragonfly.pdf \
	examples/letter.pdf \
	examples/presentation.pdf \
	examples/article.pdf \
	examples/report.pdf \
	examples/proposal.pdf
	$(RUN) bash -c "cd package && debuild -us -uc && mv ../dragonfly-latex*{.dsc,.changes,.build,tar.xz} . && touch .build"

.PHONY: clean
clean:
	rm -f  examples/*.log examples/*.aux examples/*.out examples/*.bbl examples/*.pdf examples/*.blg \
		examples/*.bcf examples/*.run.xml examples/*.toc examples/*-self.bib  examples/*.nav examples/*.snm 
	rm -f latex/*.cls latex/*.idx latex/dragonfly.sty latex/beamerthemeDragonfly.sty  latex/*.fdb_latexmk latex/*.log latex/*.fls latex/*.ind \
		latex/*.out latex/*.aux latex/*.glo latex/*.pdf latex/*.toc latex/*.ilg
	rm -rf package/debian/dragonfly-latex-templates/ 
	rm -f package/dragonfly-latex* 	package/debian/dragonfly-latex-templates.substvars package/debian/files
	rm -f package/debian/debhelper-build-stamp package/debian/dragonfly-latex-templates.debhelper.log 
	rm -f dragonfly-latex-templates_*
