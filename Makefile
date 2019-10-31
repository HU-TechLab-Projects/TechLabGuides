SOURCES = $(shell echo *.tex)
PDFS = $(SOURCES:tex=pdf)

all: $(PDFS)
	mkdir -p public
	cp $? public
	cp banner/*.svg public
	echo "<html><head><title>Turing Lab Guides</title>" > public/index.html
	echo "<link href=\"https://fonts.googleapis.com/css?family=Nunito+Sans:300,400&display=swap\" rel=\"stylesheet\">" >> public/index.html
	echo "<style>body { font-family: Nunito Sans, sans-serif } #banner { width: 100vw; height: 120px; position: absolute; top: 0; left: 0; background-color: rgb(117, 79, 122); } #tlg { width: 270px; height: 90px; margin-top: 10px; background-image: url(TuringLabGuide.svg); background-repeat: no-repeat; background-position: 20px 10px; border-right: 2px solid rgba(255,255,255,0.6); } #pcb { width: 150px; height: 60px; position: absolute; top: 0; right: 0; background-image: url(PCB.svg); background-size: contain; background-repeat: no-repeat; } #content { position: absolute; top: 120px; left: 0; padding: 30px 60px; } h1 { font-weight: normal; color: rgb(117, 79, 122); margin-bottom: 0; } ul { padding-left: 5px; margin-top: 5px; } li { list-style-type: none; margin-left: 0 } li:before { content: \"– \"; } a, a:active, a:visited { color: black; text-decoration: none; font-weight: 300 } a:hover { color: rgb(117, 79, 122); } </style>" >> public/index.html
	echo "</head><body><div id=\"banner\"><div id=\"tlg\"></div><div id=\"pcb\"></div></div><div id="content"><h1>Beschikbare guides</h1><ul>" >> public/index.html
	for PDF in $? ; do echo "<li><a href=\"$$PDF\">$$(pdfinfo $$PDF 2>/dev/null | grep Title: | sed 's/Title:[ ]*//')</a></li>" >> public/index.html ; done
	echo "</ul></div>" >> public/index.html
	echo "<div class=\"github-ribbon\" style=\"position: fixed; right: 0px; width: 150px; height: 150px; overflow: hidden; z-index: 99999; bottom: 0px;\"><a target=\"_blank\" style=\"display: inline-block; width: 200px; overflow: hidden; padding: 6px 0px; text-align: center; transform: rotate(-45deg); text-decoration: none; color: rgb(255, 255, 255); position: inherit; right: -40px; font: 700 13px &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; box-shadow: rgba(0, 0, 0, 0.5) 0px 2px 3px 0px; background-color: rgb(170, 0, 0); bottom: 45px; background-image: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15));\" href=\"https://github.com/HU-TechLab-Projects/TuringLabGuides.git\">Fork me on GitHub</a></div>" >> public/index.html
	echo "</body></html>" >> public/index.html


%.pdf: %.tex banner/PCB.pdf banner/TuringLabGuide.pdf guide.cls
	xelatex --interaction=batchmode --halt-on-error $<
	xelatex --interaction=batchmode --halt-on-error $<

clean:
	rm -rf $(SOURCES:tex=aux) $(SOURCES:tex=log) $(SOURCES:tex=out) $(SOURCES:tex=pdf) public
