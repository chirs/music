\version "2.26.0"
\header {
  title = "Loops"
  subtitle = "for five sustaining voices"
  composer = "Claude (Fable 5.1)"
  copyright = "2026 · generated text, freely reproducible"
  tagline = ##f
}
\paper { top-margin = 15\mm  ragged-last-bottom = ##t }

global = { \key f \major \tempo 4 = 60 }

\markup \column {
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

\score { \new StaffGroup <<
  \new Staff \with { instrumentName = "1" } { \global \clef treble \time 17/4 c''1~ c''2 r1 r4 d''2. r2. \bar "||" }
  \new Staff \with { instrumentName = "2" } { \global \clef treble \time 11/4 e''1 r1 r2. \bar "||" }
  \new Staff \with { instrumentName = "3" } { \global \clef treble \time 13/4 a'1~ a'4 r1 r1 \bar "||" }
  \new Staff \with { instrumentName = "4" } { \global \clef treble \time 19/4 g'2. r1 f'1~ f'4 r1 r2. \bar "||" }
  \new Staff \with { instrumentName = "5" } { \global \clef bass \time 23/4 f1~ f1 r1 r2 c1~ c2 r2. \bar "||" }
>> \layout {
  \context { \Score \remove "Timing_translator" \omit BarNumber }
  \context { \Staff \consists "Timing_translator" }
} }

\pageBreak
\score { \new StaffGroup <<
  \new Staff \with { instrumentName = "1" } {
    \global \clef treble \time 4/4
    c''1\p~ |
    c''2 r2 |
    r2. d''4~ |
    d''2 r2 |
    r4 c''2.~ |
    c''2. r4 |
    r1 |
    d''2. r4 |
    r2 c''2~ |
    c''1 |
    r1 |
    r4 d''2. |
    r2. c''4~ |
    c''1~ |
    c''4 r2. |
    r2 d''2~ |
    d''4 r2. |
    c''1~ |
    c''2 r2 |
    r2. d''4~ |
    d''2 r2 |
    r4 c''2.~ |
    c''2. r4 |
    r1 |
    d''2. r4 |
    r2 c''2~ |
    c''1 |
    r1 |
    r4 d''2. |
    r2. c''4~ |
    c''1~ |
    c''4 r2. |
    r2 d''2~ |
    d''4 r2. |
    c''1~ |
    c''2 r2 |
    r2. d''4~ |
    d''2 r2 |
    r4 c''2.~ |
    c''2. r4 |
    r1 |
    d''2. r4 |
    r2 c''2~ |
    c''1 |
    r1 |
    r4 d''2. |
    r2. c''4~ |
    c''1 |
    \bar "|."
  }
  \new Staff \with { instrumentName = "2" } {
    \global \clef treble \time 4/4
    e''1\p |
    r1 |
    r2. e''4~ |
    e''2. r4 |
    r1 |
    r2 e''2~ |
    e''2 r2 |
    r1 |
    r4 e''2.~ |
    e''4 r2. |
    r1 |
    e''1 |
    r1 |
    r2. e''4~ |
    e''2. r4 |
    r1 |
    r2 e''2~ |
    e''2 r2 |
    r1 |
    r4 e''2.~ |
    e''4 r2. |
    r1 |
    e''1 |
    r1 |
    r2. e''4~ |
    e''2. r4 |
    r1 |
    r2 e''2~ |
    e''2 r2 |
    r1 |
    r4 e''2.~ |
    e''4 r2. |
    r1 |
    e''1 |
    r1 |
    r2. e''4~ |
    e''2. r4 |
    r1 |
    r2 e''2~ |
    e''2 r2 |
    r1 |
    r4 e''2.~ |
    e''4 r2. |
    r1 |
    e''1 |
    r1 |
    r2. e''4~ |
    e''2. r4 |
    \bar "|."
  }
  \new Staff \with { instrumentName = "3" } {
    \global \clef treble \time 4/4
    a'1\p~ |
    a'4 r2. |
    r1 |
    r4 a'2.~ |
    a'2 r2 |
    r1 |
    r2 a'2~ |
    a'2. r4 |
    r1 |
    r2. a'4~ |
    a'1 |
    r1 |
    r1 |
    a'1~ |
    a'4 r2. |
    r1 |
    r4 a'2.~ |
    a'2 r2 |
    r1 |
    r2 a'2~ |
    a'2. r4 |
    r1 |
    r2. a'4~ |
    a'1 |
    r1 |
    r1 |
    a'1~ |
    a'4 r2. |
    r1 |
    r4 a'2.~ |
    a'2 r2 |
    r1 |
    r2 a'2~ |
    a'2. r4 |
    r1 |
    r2. a'4~ |
    a'1 |
    r1 |
    r1 |
    a'1~ |
    a'4 r2. |
    r1 |
    r4 a'2.~ |
    a'2 r2 |
    r1 |
    r2 a'2~ |
    a'2. r4 |
    r1 |
    \bar "|."
  }
  \new Staff \with { instrumentName = "4" } {
    \global \clef treble \time 4/4
    g'2.\p r4 |
    r2. f'4~ |
    f'1 |
    r1 |
    r2. g'4~ |
    g'2 r2 |
    r2 f'2~ |
    f'2. r4 |
    r1 |
    r2 g'2~ |
    g'4 r2. |
    r4 f'2.~ |
    f'2 r2 |
    r1 |
    r4 g'2. |
    r1 |
    f'1~ |
    f'4 r2. |
    r1 |
    g'2. r4 |
    r2. f'4~ |
    f'1 |
    r1 |
    r2. g'4~ |
    g'2 r2 |
    r2 f'2~ |
    f'2. r4 |
    r1 |
    r2 g'2~ |
    g'4 r2. |
    r4 f'2.~ |
    f'2 r2 |
    r1 |
    r4 g'2. |
    r1 |
    f'1~ |
    f'4 r2. |
    r1 |
    g'2. r4 |
    r2. f'4~ |
    f'1 |
    r1 |
    r2. g'4~ |
    g'2 r2 |
    r2 f'2~ |
    f'2. r4 |
    r1 |
    r2 g'2 |
    \bar "|."
  }
  \new Staff \with { instrumentName = "5" } {
    \global \clef bass \time 4/4
    f1\p~ |
    f1 |
    r1 |
    r2 c2~ |
    c1 |
    r2. f4~ |
    f1~ |
    f2. r4 |
    r1 |
    r4 c2.~ |
    c2. r4 |
    r2 f2~ |
    f1~ |
    f2 r2 |
    r1 |
    c1~ |
    c2 r2 |
    r4 f2.~ |
    f1~ |
    f4 r2. |
    r2. c4~ |
    c1~ |
    c4 r2. |
    f1~ |
    f1 |
    r1 |
    r2 c2~ |
    c1 |
    r2. f4~ |
    f1~ |
    f2. r4 |
    r1 |
    r4 c2.~ |
    c2. r4 |
    r2 f2~ |
    f1~ |
    f2 r2 |
    r1 |
    c1~ |
    c2 r2 |
    r4 f2.~ |
    f1~ |
    f4 r2. |
    r2. c4~ |
    c1~ |
    c4 r2. |
    f1~ |
    f1 |
    \bar "|."
  }
>> \layout {} \midi {} }
