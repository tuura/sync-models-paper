SRC = ./src
BUILD = ./build

main: paper.pdf

paper.pdf: $(SRC)/*.tex
	@ mkdir -p $(BUILD)
	@ pdflatex \
		-interaction=nonstopmode \
		-output-directory=$(BUILD) \
		-include-directory=src \
		$(SRC)/paper.tex paper.pdf

	@ cp $(SRC)/*.bib $(BUILD)
	@ cd $(BUILD); bibtex paper.aux
	@ rm $(BUILD)/*.bib

clean:
	rm $(BUILD)/*
	rmdir $(BUILD)
