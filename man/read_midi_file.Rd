% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mydough.R
\name{read_midi_file}
\alias{read_midi_file}
\title{Read MIDI file}
\usage{
read_midi_file(midi_file)
}
\arguments{
\item{midi_file}{a character string with the path to a MIDI file. Note that
"~" does \emph{\strong{not}} work - you need to specify an absolute path!}
}
\value{
the MidiFile object read from the given file
}
\description{
Reads a MIDI file using \code{mido}
}
\examples{
  reticulate::use_condaenv("mydough")
  midi_file_object <- mydough::read_midi_file(system.file(
    "Eikosany-MIDI-Files", "eikosany-5-7-9-11.mid", package = "mydough"
  ))
  print(midi_file_object)

}
