all: reqs.pdf use-cases.pdf

reqs.pdf: reqs.md
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists -s -S --latex-engine=pdflatex --bibliograph=cse870-backuprollover.bib --template=latex.tpl $< -o $@


use-cases.pdf: use-cases.md
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists+definition_lists -s -S --latex-engine=pdflatex --bibliograph=cse870-backuprollover.bib --template=latex.tpl $< -o $@

clean:
	rm -rf reqs.pdf
