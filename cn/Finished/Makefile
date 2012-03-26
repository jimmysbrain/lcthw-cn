JUNK_FILES=$(FINAL).* *.aux *.log styles/*.aux
SOURCE=book
WEBSITE=learncodethehardway.org:/var/www/learncodethehardway.org/c/
FINAL=learn-c-the-hard-way

book:
	cp -n ../InProgress/*.tex .
	cp -n ../../*.tex .
	cp -r ../../code .
	dexy
	cp Makefile output/
	${MAKE} -C output clean $(FINAL).pdf
	rm -rf output/*.dvi output/*.pdf
	${MAKE} -C output $(FINAL).pdf

draft: $(FINAL).dvi

$(FINAL).pdf:
	cp $(SOURCE).tex $(FINAL).tex
	#pdflatex -halt-on-error $(FINAL).tex
	xelatex $(FINAL).tex

html: 
	cp -r site/js site/css output/
	cd output && cp $(SOURCE)-html.tex $(FINAL).tex
	cd output && htlatex $(FINAL).tex "book,index=1,2,next,fn-in,charset=utf-8,NoFonts" "-cunihtf -utf8"
	#cd output && htlatex $(FINAL).tex "book,index=1,2,next,xhtml,fn-in" -utf8
	sed -ire '/<head><title>/c\<head><title><\/title>' output/*.html  # title has encoding issues
	python clean.py output/*.html
	sed -i -e 's#</br>##g' output/*.html
	
	
view: $(FINAL).pdf
	evince $(FINAL).pdf

clean:
	rm -rf $(JUNK_FILES)
	find . -name "*.aux" -exec rm {} \;
	rm -rf output

release: clean $(FINAL).pdf draft $(FINAL).pdf sync

sync: book html
	rsync -vz output/$(FINAL).pdf $(WEBSITE)/$(FINAL).pdf
	rsync -vz output/$(FINAL).html $(WEBSITE)/book/index.html
	rsync -vz output/*.html output/*.css $(WEBSITE)/book/

