TEX = resume-full.tex
PDF = resume-full.pdf
HTML = resume-full.html resume-full.css

all: $(PDF) $(HTML)

$(PDF): $(TEX)
	arara $(TEX)

$(HTML): $(TEX)
	htlatex $(TEX)

.PHONY: clean
cleanaux:
	rm -f *.4ct *.4tc *.aux *.dvi *.idv *.lg *.log *.out *.tmp *.xref

.PHONY: cleanall
clean: cleanaux
	rm -f $(PDF) $(HTML)