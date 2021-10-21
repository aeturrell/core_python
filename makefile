# Makefile to generate markdown docs

# Figure out which ipynb files we could compile
NOTEBOOKS=$(wildcard *.ipynb)

# Corresponding output files
MDFILES=$(patsubst %.ipynb,outputs/%.md,$(NOTEBOOKS))
MDDIRECS=$(patsubst outputs/%.md,outputs/%_files,$(MDFILES))
md: $(MDFILES)

# Define the commands that will do the conversion
CONVERT=poetry run jupyter nbconvert --allow-errors -y --execute

outputs/%.md: %.ipynb
		$(CONVERT) $(<:=) --to=markdown --output=$(@:=)


# Define the cleanup procedure
clean:
	rm -f $(MDFILES)
	rm -r $(MDDIRECS)