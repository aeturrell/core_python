# Makefile to generate markdown docs from jupyter notebooks that get executed

.PHONY: all clean

all: md move

# Figure out which ipynb files to execute and convert to markdown
NOTEBOOKS=$(wildcard *.ipynb)

# Corresponding output files
MDFILES=$(patsubst %.ipynb,%.md,$(NOTEBOOKS))
MDDIRECS=$(patsubst %.md,%_files,$(MDFILES))
md: $(MDFILES)

# Define the commands that will do the conversion
CONVERT=poetry run jupyter nbconvert --allow-errors -y --execute

# Convert jupyter notebooks to markdown
%.md: %.ipynb
		$(CONVERT) $(<:=) --to=markdown --output=$(@:=)

# Move all of the created files to the outputs directory
move:
	mv $(MDFILES) outputs/ && \
	mv $(MDDIRECS) outputs/

# Remove the created files that are in outputs/
clean:
	rm -f outputs/$(MDFILES)
	rm -r outputs/$(MDDIRECS)