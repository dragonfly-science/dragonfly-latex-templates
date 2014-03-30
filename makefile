letter.pdf: letter.tex dragonfly.sty
	latexmk -xelatex letter.tex

all: dragonfly.pdf letter.pdf

package: dragonfly.sty

dragonfly.sty: dragonfly.ins dragonfly.dtx 
	latex dragonfly.ins

dragonfly.pdf: dragonfly.dtx dragonfly.sty
	latexmk -xelatex dragonfly.dtx

example.tex: example.md
	pandoc --read markdown_github+footnotes+all_symbols_escapable \
		   --to latex $< \
		   | sed '/\\itemsep1pt/d' > $@


clean:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls \
		dragonfly-article.cls dragonfly.pdf letter.pdf \
		letter.aux letter.log letter.out dragonfly.aux dragonfly.dtx.backup \
		dragonfly.glo dragonfly.idx dragonfly.log 
