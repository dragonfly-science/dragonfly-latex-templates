all: package

package: dragonfly.ins dragonfly.dtx
	latex dragonfly.ins
	pdflatex dragonfly.dtx
	pdflatex dragonfly.dtx


simple.pdf: example.tex simple.tex dragonfly-article.cls dragonfly.sty
	xelatex simple.tex; xelatex simple.tex


example.tex: example.md
	pandoc --read markdown_github+footnotes+all_symbols_escapable \
		   --to latex $< \
		   | sed '/\\itemsep1pt/d' > $@


clean:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls dragonfly-article.cls dragonfly.pdf
