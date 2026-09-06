# music

AI-generated music. Everything here that makes sound or sits on a staff was
written by a language model from a prompt. The prompt, the model, and any hand
edits are recorded next to each piece.

The lineage is process music: Eno, Riley, Lucier. Systems that are simple to
describe and produce more than they contain.

## Layout

- `scores/` — notated pieces. One directory each: LilyPond source, the
  generator script when the piece is procedural, `NOTES.md`, and the rendered
  PDF and MIDI.
- `generative/` — browser sketches that play rather than print.
  `generative/_2017/` holds three Web Audio exercises from Tero Parviainen's
  systems-music tutorials, kept as the repo's pre-history.
- `doc/` — reading.

## Rendering

Requires LilyPond (`brew install lilypond`) and Python 3.

    make          # render every score to PDF and MIDI
    make clean

A `.py` next to a score regenerates its `.ly`; edit the script, not the output.
