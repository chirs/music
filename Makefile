LY   := $(wildcard scores/*/*.ly) $(patsubst %.py,%.ly,$(wildcard scores/*/*.py))
PDF  := $(sort $(LY:.ly=.pdf))

all: $(PDF)

%.ly: %.py
	python3 $< > $@

%.pdf: %.ly
	lilypond -dno-point-and-click -o $* $<

clean:
	rm -f scores/*/*.pdf scores/*/*.midi

.PHONY: all clean
.SECONDARY:
