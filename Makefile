all: reqs.pdf use-cases.pdf BackupRollover_Doc_Scott_Hoffman_Holbrook.pdf

reqs.pdf: reqs.md
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists -s -S --latex-engine=pdflatex --bibliograph=cse870-backuprollover.bib --template=latex.tpl $< -o $@


use-cases.pdf: use-cases.md
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists+definition_lists -s -S --latex-engine=pdflatex --bibliograph=cse870-backuprollover.bib --template=latex.tpl $< -o $@

BackupRollover_Doc_Scott_Hoffman_Holbrook.pdf: use-cases-and-reqs.md
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists+definition_lists -s -S --latex-engine=pdflatex --bibliograph=cse870-backuprollover.bib --template=latex.tpl $< -o $@


clean:
	rm -rf reqs.pdf
