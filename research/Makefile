
###################################################
#
# file: Makefile
#
# @Author:   Iacovos G. Kolokasis
# @Version:  27-07-202
# @email:    kolokasis@ics.forth.gr
#
# Makefile
#
####################################################

PAPER = paper
TEX = $(wildcard *.tex)
BIB = paper.bib
FIGS = $(wildcard fig/*.pdf)

.PHONY: all clean

all: $(PAPER).pdf

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

view:
	@(evince $(PAPER).pdf 2> /dev/null & echo $$! > evince.pid)

commit: 
	-git status
ifeq ($(m),)
	-git commit -a -m "Commit all changes"
else
	git commit -a -m "$m"
endif
	git push

up: update

update:
	-git status
	git pull

status:
	git status

lastdiff2:
	-git diff --name-status HEAD HEAD~2

lastdiff:
	-git diff --name-status HEAD HEAD~1

aspell:
	aspell --lang=en --mode=tex check $f

remote:
	-cd $(MIRROR_REPO) && git fetch -p origin && git push --no-verify --mirror && cd -

push:
	-cd $(GITHUB_REPO) && git pull && git push $(REPO) && cd -

plot:
	-cd raw/scripts && ./run_all.sh 0 && cd -

tag:
	-git tag $m
	-git push origin --tags

cc: clean commit


distclean: clean
	\rm -rf $(PAPER).pdf


clean:
	\rm -f *.aux *.bbl *.blg *.log evince.pid *.toc *.lof *.out

