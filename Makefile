STYLE=dejavu

# requires: docutils
pdf: specyfikacja.rst
	rst2pdf specyfikacja.rst -o specyfikacja.pdf -s ${STYLE}
