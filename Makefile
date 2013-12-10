STYLE=local,twelvepoint,dejavu,kerning,sphinx
STYLE_SERIF=local,twelvepoint,freetype-serif

# requires: docutils
pdf: specyfikacja.rst
	rst2pdf specyfikacja.rst -o specyfikacja.pdf -s ${STYLE}

# requires: docutils
pdf_serif: specyfikacja.rst
	rst2pdf specyfikacja.rst -o specyfikacja_serif.pdf -s ${STYLE_SERIF}

all: pdf pdf_serif
