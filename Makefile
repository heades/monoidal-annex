PDFLATEX = pdflatex
BIBTEX = bibtex
OTT = ott
OTT_FLAGS := -tex_wrap false -tex_show_meta false -picky_multiple_parses false
SKIM := skim_revert.sh
SKIMRevinPath := $(shell command -v $(SKIM) 2> /dev/null)

TexFileName := spec
OTTFileName := spec
OTTFile := $(OTTFileName).ott
OTTGen := $(OTTFileName)-inc.tex
OTTOutputFile := $(TexFileName).tex
OTTPrefix := NCG

PDF := main.pdf

all: pdf
  # This is for my private machine.  It forces my PDF reader to reload.
  # It should not run unless "skim_revert.sh" is in your PATH.
  ifdef SKIMRevinPath
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
  endif

pdf : main.pdf

# Now this takes the full LaTex translation and compiles it using
# pdflatex.
main.pdf : Makefile main.tex
	$(PDFLATEX) -jobname=main main.tex
	$(PDFLATEX) -jobname=main main.tex
	$(BIBTEX) main
	$(PDFLATEX) -jobname=main main.tex

clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg *.rel *~ *.vtc *.out *.spl *-inc.tex *-output1.tex