purl = "$(R_HOME)/bin/Rscript" --no-restore --no-save tools/purl.R "$(1)" "$(2)"

rfiles := $(patsubst Rmd/%.Rmd,R/%.GENERATED.R,$(wildcard Rmd/*.Rmd))
rhtmlfiles := $(patsubst Rmd/%.Rmd,Rmd/%.html,$(wildcard Rmd/*.Rmd))
rmdfiles := $(wildcard Rmd/*.Rmd)

all: $(rfiles)

R/%.GENERATED.R: Rmd/%.Rmd
	$(call purl,$^,$@)

clean:
	rm -f R/*.GENERATED.R $(rhtmlfiles)

.PHONY: all clean
