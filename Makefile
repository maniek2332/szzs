STYLE=local,twelvepoint,dejavu,kerning,sphinx

# requires: docutils
pdf: specyfikacja.rst
	rst2pdf specyfikacja.rst -o specyfikacja.pdf -s ${STYLE}
