mydough - read and write MIDI files from R
================

## Motivation

Algorithmic composition requires the ability to read and write MIDI
files. While there are other R packages that read or write MIDI files,
they add other capabilities that might not be necessary, like creating
audio files or printable scores, read MIDI files but don’t write them,
or require an external music engraving package like “MuseScore” or
“lilypond”. `mydough` has a deliberately narrow scope - just read and
write MIDI files!

`mydough` interfaces to the Python `mido` MIDI library via `reticulate`.
`mydough` is completely independent of other Python environments you may
or may not have on your system. It installs its own isolated
`mambaforge` `mamba` / `conda` package management system, its own
`mamba` virtual environment, and its own copy of `mido`.

## About the name

Well … `midiR` was taken. `pyramidi` uses `mido` to access MIDI files,
and “MY-dough” is how I pronounce `mido`. `pyramidi` has many features I
don’t need. So … `mydough` - only what I … knead.
