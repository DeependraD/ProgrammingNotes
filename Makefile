all: Friendship.pdf
pdf: Friendship.pdf
.PHONY: all pdf

Friendship.pdf: Friendship.Rmd 
		R -e "rmarkdown::render('Friendship.Rmd', 'pdf_document')"

clean:
	rm figure/*.pdf figure/*.png Friendship.md Friendship.pdf
