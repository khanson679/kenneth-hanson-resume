BASENAME := resume-full
TEX := $(BASENAME).tex
BUILD := build
PDF := $(BUILD)/$(BASENAME).pdf
HTML := $(BUILD)/$(BASENAME).html $(BASENAME).css

all: $(PDF)

$(PDF): $(TEX) $(BUILD)
	pdflatex --output-directory=$(BUILD) $(TEX)

$(HTML): $(TEX) $(BUILD)
	cd $(BUILD) && htlatex ../$(TEX) "" ""

$(BUILD):
	mkdir -p $(BUILD)

.PHONY: clean cleanaux

clean: cleanaux
	rm -vrf $(BUILD)

cleanaux:
	find . -regextype posix-egrep -regex ".*\.(4ct|4tc|aux|dvi|idv|lg|log|out|tmp|xref)" | xargs rm -vf
