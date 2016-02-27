SRC_FILE = resume-full.tex
OUT_FILE = resume-full.pdf


all: $(OUT_FILE)

$(OUT_FILE): $(SRC_FILE)
	arara $(SRC_FILE)

.PHONY: clean
clean:
	rm *.aux *.log *.out

.PHONY: cleanall
cleanall: clean
	rm $(OUT_FILE)