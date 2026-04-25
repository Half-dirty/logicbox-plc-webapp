MAIN = paper
LATEX = pdflatex
BIBTEX = bibtex8
FLAGS = -interaction=nonstopmode -halt-on-error

SOURCES = $(wildcard *.tex)
BST_FILES = $(wildcard *.bst)
STY_FILES = mospolytech_coursework.sty

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(SOURCES) $(BST_FILES) $(STY_FILES)
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(LATEX) $(FLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.pdf *.bbl *.blg
