images:
	Rscript scripts/median/001.R
	Rscript scripts/median/003.R

book: images
	perl merge_text.pl
	pandoc -o book.pdf book.md
	rm -f book.md

clean:
	rm -rf images
	rm -f book.md
