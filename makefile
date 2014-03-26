all: simple.pdf

package: dragonfly.sty

dragonfly.sty: dragonfly.ins dragonfly.dtx 
	latex dragonfly.ins

dragonfly.pdf: dragonfly.dtx
	xelatex dragonfly.dtx
	xelatex dragonfly.dtx


simple.pdf: simple.tex dragonfly.sty
	latexmk -xelatex simple.tex

example.tex: example.md
	pandoc --read markdown_github+footnotes+all_symbols_escapable \
		   --to latex $< \
		   | sed '/\\itemsep1pt/d' > $@


clean:
	rm -f dragonfly.sty dragonfly-report.cls dragonfly-letter.cls \
		dragonfly-article.cls dragonfly.pdf simple.pdf \
		simple.aux simple.log dragonfly.aux dragonfly.dtx.backup \
		dragonfly.glo dragonfly.idx dragonfly.log 
