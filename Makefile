all: reqs.pdf

reqs.pdf: reqs.md
	pandoc -r markdown+yaml_metadata_block -s -S --latex-engine=pdflatex --template=latex.tpl $< -o $@

clean:
	rm -rf reqs.pdf
