all: simple.pdf

simple.pdf: example.tex simple.tex dragonfly-article.cls dragonfly.sty
	xelatex simple.tex; xelatex simple.tex


example.tex: example.md
	pandoc --read markdown_github+footnotes+all_symbols_escapable \
		   --to latex $< \
		   | sed '/\\itemsep1pt/d' > $@

