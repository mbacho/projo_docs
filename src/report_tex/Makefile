filename=report
builddir=build

.PHONY: pdf
pdf:
	if [ ! -e "${builddir}" ]; then mkdir ${builddir}; fi
	pdflatex --output-directory=${builddir} ${filename}.tex
	bibtex ${builddir}/${filename}.aux
	pdflatex --output-directory=${builddir} ${filename}.tex

.PHONY: clean
clean:
	-rm -r ${builddir}
	-rm ${filename}.pdo
	-rm ${filename}.aux
	-rm ${filename}.lof
	-rm ${filename}.log
	-rm ${filename}.lot
	-rm ${filename}.out
	-rm ${filename}.pdf
	-rm ${filename}.tdo
	-rm ${filename}.toc
	-rm ${filename}.dvi

read:
	if [ -e "${builddir}/${filename}.pdf" ]; then evince ${builddir}/${filename}.pdf; else echo "pdf not generated"; fi


