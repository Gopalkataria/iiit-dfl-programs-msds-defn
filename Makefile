# Makefile to export all .org files to PDF via Emacs batch mode

ORG_FILES := $(wildcard *.org)
PDFS      := $(ORG_FILES:.org=.pdf)

all: $(PDFS)

%.pdf: %.org
	emacs $< --batch -Q -l org --eval="(require 'ox-latex)" -f org-latex-export-to-pdf

clean:
	rm -f $(PDFS)

.PHONY: all clean
