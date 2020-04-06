BASENAME := resume-full
TEX := $(BASENAME).tex
BUILD := build
OUT := out
PDF := $(BUILD)/$(BASENAME).pdf
HTML := $(BUILD)/$(BASENAME).html $(BASENAME).css

all: $(PDF)

$(PDF): $(TEX) $(BUILD) $(OUT)
	pdflatex --output-directory=$(BUILD) $(TEX)
	cp $(PDF) $(OUT)

$(HTML): $(TEX) $(BUILD) $(OUT)
	cd $(BUILD) && htlatex ../$(TEX) "" ""
	cp $(HTML) $(OUT)

$(BUILD):
	mkdir -p $(BUILD)

$(OUT):
	mkdir -p $(OUT)

.PHONY: clean cleanaux

clean:
	rm -vrf $(BUILD) $(OUT)

cleanaux:
	rm -vrf $(BUILD)
