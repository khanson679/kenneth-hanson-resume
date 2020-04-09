BASENAME := resume-full
TEX := $(BASENAME).tex
BUILD := build
OUT := out
PDF := $(BUILD)/$(BASENAME).pdf
HTML := $(OUT)/$(BASENAME).html

all: $(PDF) $(HTML)

$(PDF): $(TEX) $(BUILD)
	pdflatex --output-directory=$(BUILD) $(TEX)
	while grep 'Rerun to get ' $(BUILD)/*.log; \
		do pdflatex --output-directory=$(BUILD) $(TEX); \
	done
	mkdir -p $(OUT)
	cp $(PDF) $(OUT)

$(HTML): $(TEX)
	mkdir -p $(OUT)
	pandoc $(TEX) -o $(HTML)

$(BUILD):
	mkdir -p $(BUILD)

.PHONY: clean cleanaux

clean:
	rm -vrf $(BUILD) $(OUT)

cleanaux:
	rm -vrf $(BUILD)
