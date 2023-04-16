mydough - read and write MIDI files from R
================

## Motivation

Algorithmic composition requires the ability to read and write Musical
Instrument Digital Interface (MIDI) files (Back 1999). While there are
other R packages that read or write MIDI files, they add other
capabilities that might not be necessary, like creating audio files or
printable scores, read MIDI files but don’t write them, or require an
external music engraving package like “MuseScore” or “lilypond”.

In addition, some of the other packages have an implicit or explicit
focus on the standard Western 12-tone equal temperament scheme of tuning
musical instruments. Microtonal composers like myself need to be able to
express our scores in whatever music theory we find convenient. The MIDI
standard now provides means for escaping the 12-tone equal tempered
realm, and several physical synthesizers and many software ones can use
these escapes.

`mydough` has a deliberately narrow scope - just read and write MIDI
files! `mydough` interfaces to the Python
[`mido`](https://mido.readthedocs.io/en/latest/index.html) (Mido Project
2023) MIDI library via
[`reticulate`](https://rstudio.github.io/reticulate/) (Ushey, Allaire,
and Tang 2023). `mydough` is completely independent of other Python
environments you may or may not have on your system. It installs its own
isolated `conda` virtual environment and its own copy of `mido`.

## About the name

As I noted above, other R packages that read and write MIDI have
features I don’t need, and I pronounce `mido` “MY-dough”. So here it
is - `mido` without the stuff I don’t … knead.

## Getting started

1.  Install `remotes` from CRAN.
2.  `remotes::install_github("AlgoCompSynth/mydough")`.
3.  `mydough::install_mido()`.

`install_mido()` will install Miniconda in the system-dependent default
location if it can’t find an existing `conda`.

## Code of Conduct

Please note that the mydough project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Back1999" class="csl-entry">

Back, David. 1999. “Standard MIDI File Format, Updated —
Music.mcgill.ca.”
<https://www.music.mcgill.ca/~ich/classes/mumt306/StandardMIDIfileformat.html>.

</div>

<div id="ref-midoMidoMIDI" class="csl-entry">

Mido Project. 2023. “Mido - MIDI Objects for Python &#X2014; Mido 1.2.10
Documentation — Mido.readthedocs.io.”
<https://mido.readthedocs.io/en/latest/index.html>.

</div>

<div id="ref-Ushey2023" class="csl-entry">

Ushey, Kevin, JJ Allaire, and Yuan Tang. 2023. *Reticulate: Interface to
’Python’*. <https://rstudio.github.io/reticulate/>.

</div>

</div>
