.PHONY: examples view

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, cv, $x.pdf)

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

view:
	@(evince $(EXAMPLES_DIR)/cv.pdf 2> /dev/null & echo $$! > evince.pid)

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(EXAMPLES_DIR)/*.aux $(EXAMPLES_DIR)/*.log $(EXAMPLES_DIR)/*.out
	rm -rf evince.pid
