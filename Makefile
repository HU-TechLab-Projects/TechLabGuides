SOURCES = $(shell echo *.tex)
PDFS = $(SOURCES:tex=pdf)

all: $(PDFS)

%.pdf: %.tex banner/PCB.pdf banner/TuringLabGuide.pdf guide.cls
	xelatex --interaction=batchmode --halt-on-error $<
	xelatex --interaction=batchmode --halt-on-error $<

clean:
	rm -f $(SOURCES:tex=aux) $(SOURCES:tex=log) $(SOURCES:tex=out) $(SOURCES:tex=pdf)
