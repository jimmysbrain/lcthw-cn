JUNK_FILES=$(FINAL).* *.aux *.log styles/*.aux
SOURCE=book
WEBSITE=/var/www/learncodethehardway.org/c/
FINAL=LearnCTheHardWay-preview

book:
	dexy
	cp Makefile output/
	cp pastie.sty output/
	${MAKE} -C output clean $(FINAL).pdf
	rm -rf output/*.dvi output/*.pdf
	${MAKE} -C output $(FINAL).pdf

draft: $(FINAL).dvi

$(FINAL).pdf:
	cp $(SOURCE).tex $(FINAL).tex
	pdflatex -halt-on-error $(FINAL).tex

html: 
	cd output && htlatex $(FINAL).tex
	
view: $(FINAL).pdf
	evince $(FINAL).pdf

clean:
	rm -rf $(JUNK_FILES)
	find . -name "*.aux" -exec rm {} \;
	rm -rf output

release: clean $(FINAL).pdf draft $(FINAL).pdf sync

sync: book html
	rsync -vz output/$(FINAL).pdf $(WEBSITE)/$(FINAL).pdf
	rsync -vz output/$(FINAL).html $(WEBSITE)/book.html
	rsync -vz output/$(FINAL).css $(WEBSITE)/

