########################################################
####  Generate .md, .html, and .pdf files of slides ####
########################################################

# Based on: https://gist.github.com/ramnathv/b1ff25adcccebfdd44d6
# See also: https://github.com/ramnathv/slidify/issues/15

# Install PhantomJS and CasperJS for this to work

# PDFs are pretty ugly at the moment...

DELAY = 1000
RMD_FILE = woo_underice_iaglr_2015.Rmd
HTML_FILE = $(patsubst %.Rmd, %.html, $(RMD_FILE))
PDF_FILE  = $(patsubst %.html, %.pdf, $(HTML_FILE))

files:
	@echo $(RMD_FILE)
	@echo $(HTML_FILE)
	@echo $(PDF_FILE)

html: $(HTML_FILE)
pdf: $(PDF_FILE)
all: html pdf

%.pdf: %.html
	casperjs makepdf.js $< $@ $(DELAY)
	cp $@ 27_Chittenden_10\:20_Woo.pdf

%.html: %.Rmd
	R -e "slidify::slidify('$<')"
