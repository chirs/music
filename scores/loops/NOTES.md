# Loops

**Generated** 2026-09-06 by Claude (Fable 5.1) in a Claude Code session.

**Prompt** (paraphrased from conversation): first piece for the repo; "something
short in the process-music lineage", a piece built from a few overlapping
loops of different lengths, Music for Airports style, written out so the phase
relationships are visible on the page.

**What it is.** Five voices, each a single cell of one or two long notes and
rests. Cell lengths 17, 11, 13, 19, 23 beats, chosen pairwise coprime so the
combined pattern does not repeat for 1,062,347 beats. Pitches are drawn from
F major minus B-flat so any simultaneity is consonant. The score page shows
the five cells, then the first 48 bars unrolled.

**Process.** `loops.py` defines the cells and emits LilyPond. `make` renders.

**Hand edits.** None.
