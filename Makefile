images:
	Rscript scripts/median/001.R

book: images
	julia merge_text.jl
	pandoc -o book.pdf book.md
	rm -f book.md

clean:
	rm -rf images
	rm -f book.md
