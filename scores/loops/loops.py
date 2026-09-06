"""Five loops of coprime length, unrolled so their alignments are visible."""

BARS = 48
BEATS_PER_BAR = 4
DUR = {1: "4", 2: "2", 3: "2.", 4: "1"}

# (pitch or None for rest, duration in beats); loop lengths 17 13 11 19 23
VOICES = [
    ("treble", [("c''", 6), (None, 5), ("d''", 3), (None, 3)]),
    ("treble", [("e''", 4), (None, 7)]),
    ("treble", [("a'", 5), (None, 8)]),
    ("treble", [("g'", 3), (None, 4), ("f'", 5), (None, 7)]),
    ("bass", [("f", 8), (None, 6), ("c", 6), (None, 3)]),
]


def unroll(loop, total):
    t = 0
    while t < total:
        for pitch, d in loop:
            if t >= total:
                return
            d = min(d, total - t)
            yield pitch, t, d
            t += d


def chunks(start, d):
    while d:
        n = min(d, BEATS_PER_BAR - start % BEATS_PER_BAR)
        yield n
        start += n
        d -= n


def render(loop, total):
    out, beat, first = [], 0, True
    for pitch, start, d in unroll(loop, total):
        parts = list(chunks(start, d))
        for i, n in enumerate(parts):
            if pitch is None:
                tok = "r" + DUR[n]
            else:
                tok = pitch + DUR[n]
                if first:
                    tok += "\\p"
                    first = False
                if i < len(parts) - 1:
                    tok += "~"
            out.append(tok)
            beat += n
            if beat % BEATS_PER_BAR == 0:
                out.append("|\n   ")
    return " ".join(out)


def cell(loop):
    length = sum(d for _, d in loop)
    notes = " ".join(
        ("r" if p is None else p) + DUR[min(d, 4)]
        + ("~" if p and d > 4 else "")
        + (" " + p + DUR[d - 4] if p and d > 4 else "")
        + (" r" + DUR[d - 4] if p is None and d > 4 else "")
        for p, d in loop
    )
    return length, notes


print(r'''\version "2.26.0"
\header {
  title = "Loops"
  subtitle = "for five sustaining voices"
  composer = "Claude (Fable 5.1)"
  copyright = "2026 · generated text, freely reproducible"
  tagline = ##f
}
\paper { top-margin = 15\mm  ragged-last-bottom = ##t }

global = { \key f \major \tempo 4 = 60 }
''')

print(r'''\markup \column {
  \vspace #1
  \wordwrap {
    Each voice repeats its cell without pause. The cells are 17, 11, 13, 19
    and 23 beats long, so the voices drift against one another and no bar of
    the unrolled score recurs. The first 48 bars are written out below; the
    piece may be continued for as long as anyone likes. Sustain fully; let
    notes overlap; no accents.
  }
  \vspace #1
}
''')

print(r'\score { \new StaffGroup <<')
for i, (clef, loop) in enumerate(VOICES, 1):
    length, notes = cell(loop)
    print(f'  \\new Staff \\with {{ instrumentName = "{i}" }} '
          f'{{ \\global \\clef {clef} \\time {length}/4 {notes} \\bar "||" }}')
print(r'''>> \layout {
  \context { \Score \remove "Timing_translator" \omit BarNumber }
  \context { \Staff \consists "Timing_translator" }
} }''')

print(r'''
\pageBreak
\score { \new StaffGroup <<''')
for i, (clef, loop) in enumerate(VOICES, 1):
    body = render(loop, BARS * BEATS_PER_BAR)
    print(f'  \\new Staff \\with {{ instrumentName = "{i}" }} {{\n'
          f'    \\global \\clef {clef} \\time 4/4\n    {body} \\bar "|."\n  }}')
print(r'>> \layout {} \midi {} }')
