filename=report
builddir=build

.PHONY: pdf
pdf:
	mkdir ${builddir}
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
		
read:
	evince ${builddir}/${filename}.pdf
	
