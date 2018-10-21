BASENAME := resume-full
TEX := $(BASENAME).tex
PDF := $(BASENAME).pdf
HTML := $(BASENAME).html $(BASENAME).css

all: $(PDF)

$(PDF): $(TEX)
	arara $(TEX)

$(HTML): $(TEX)
	htlatex $(TEX)

.PHONY: clean cleanaux

clean: cleanaux
	rm -f $(PDF) $(HTML)

cleanaux:
	rm -f *.4ct *.4tc *.aux *.dvi *.idv *.lg *.log *.out *.tmp *.xref

