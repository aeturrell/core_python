# Makefile to generate markdown docs from jupyter notebooks that get executed

.PHONY: all clean

all: md specialmdone specialmdtwo format fixletsplot move

# Figure out which ipynb files to execute and convert to markdown
NOTEBOOKS=$(wildcard empirical_*.ipynb)

# Corresponding output files
MDFILES=$(patsubst %.ipynb,%.md,$(NOTEBOOKS))
MDDIRECS=$(patsubst %.md,%_files,$(MDFILES))
FINALMDFILES=$(patsubst %.md,outputs/%.md,$(MDFILES))
FINALMDDIRECS=$(patsubst %_files,outputs/%_files,$(MDDIRECS))
md: $(MDFILES)

# Define the commands that will do the conversion
CONVERT=poetry run jupyter nbconvert --allow-errors -y --execute

# Convert jupyter notebooks to markdown
%.md: %.ipynb
		$(CONVERT) $(<:=) --to=markdown --output=$(@:=)

specialmdone: technical_reference.ipynb
		$(CONVERT) $(<:=) --to=markdown --output=technical_reference.md

specialmdtwo: getting_started_in_python.ipynb
		$(CONVERT) $(<:=) --to=markdown --output=getting_started_in_python.md

# sorts a problem with letsplot conversion of figures to md code
fixletsplot:
	poetry run python fix_letsplot_conv_to_md.py

# format all of the md files
format:
	poetry run mdformat $(MDFILES)
	poetry run mdformat technical_reference.md
	poetry run mdformat getting_started_in_python.md

# Move all of the created files to the outputs directory
move:
	mv getting_started_in_python.md outputs/ && \
	mv technical_reference.md outputs/ && \
	mv -f $(MDFILES) outputs/ && \
	mv -f $(MDDIRECS) outputs/

# Remove the created files that are in outputs/
clean:
	rm outputs/*.md
	rm -f $(FINALMDFILES)
	rm -r $(FINALMDDIRECS)