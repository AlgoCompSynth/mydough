#' @title Install `mido`
#' @name install_mido
#' @description Creates the `mydough` conda environment and installs Python,
#' `numpy` and `mido` in it.
#' @details If `Miniconda` isn't installed, `install_mido` installs it in the
#' default location.
#' @export install_mido
#' @importFrom reticulate conda_binary
#' @importFrom reticulate install_miniconda
#' @importFrom reticulate conda_create
#' @importFrom reticulate use_condaenv
#' @importFrom reticulate py_discover_config
#' @returns a `reticulate` `py_config` object
#' @examples
#' \dontrun{
#'   config <- mydough::install_mido()
#'   print(config)
#' }
#'

install_mido <- function() {

  # Install Miniconda if needed
  conda_binary_path <-
    try(reticulate::conda_binary(), silent = TRUE)
  if (inherits(conda_binary_path, "try-error")) {
    cat(
      "\ncould not find 'conda'.\n",
      "'Miniconda' will be installed in the default location.\n"
    )

    is_ok <-
      try(reticulate::install_miniconda(), silent = TRUE)
    if (inherits(is_ok, "try-error")) {
      stop("'Miniconda install failed - cannot continue!")
    }
    cat("\n'Miniconda' install successful.\n")
  }

  # create 'mydough' conda environment if needed
  mydough_path <-
    try(reticulate::use_condaenv("mydough"), silent = TRUE)
  if (inherits(mydough_path, "try-error")) {
    cat(
      "\ncould not find 'mydough' conda environment\n",
      "'mydough' will be created."
    )
    is_ok <- try(
      reticulate::conda_create(
        envname = "mydough",
        packages = c(
         "python",
         "numpy",
         "mido"
        )
      ),
      silent = TRUE
    )
    if (inherits(is_ok, "try-error")) {
      stop("'mydough; create failed - cannot continue!")
    }
    cat("\n'mydough' create successful.\n")
  }

  # all good - return the Python configuration
  reticulate::use_condaenv("mydough")
  reticulate::py_discover_config()

}

#' @title Read MIDI file
#' @name read_midi_file
#' @description Reads a MIDI file using `mido`
#' @export read_midi_file
#' @importFrom reticulate use_condaenv
#' @importFrom reticulate import
#' @param midi_file a character string with the path to a MIDI file. Note that
#' "~" does ***not*** work - you need to specify an absolute path!
#' @returns the MidiFile object read from the given file
#' @examples
#' \dontrun{
#'   remotes::install_github("AlgoCompSynth/eikossany") # example MIDI files
#'   reticulate::use_condaenv("mydough")
#'   midi_file_object <- mydough::read_midi_file(
#'     system.file("Eikosany-MIDI-Files", "eikosany-5-7-9-11.mid", package = "eikosany")
#'   )
#'   print(midi_file_object)
#' }
#'

read_midi_file <- function(midi_file) {
  reticulate::use_condaenv("mydough")
  mido <- reticulate::import("mido")
  midi_file_object <- mido$MidiFile(midi_file)
  return(midi_file_object)
}

#' @title New MIDI file
#' @name new_midi_file
#' @description Create a new MidiFile object using `mido`
#' @export new_midi_file
#' @importFrom reticulate use_condaenv
#' @importFrom reticulate import
#' @importFrom Rdpack reprompt
#' @param type integer, MIDI file type, default is 1
#' @param ticks_per_beat integer, default is 480
#' @returns an empty MidiFile object
#' @details The "empty" MidiFile object from `mido` defaults to a type 1
#' MIDI file with `ticks_per_beat` set to 480. From
#' \insertCite{midoMidoMIDI}{mydough}, section 3.10.4, "File Types":
#'
#' "There are three types of MIDI files:
#' \itemize{
#' \item type 0 (single track): all messages are saved in one track
#' \item type 1 (synchronous): all tracks start at the same time
#' \item type 2 (asynchronous): each track is independent of the others."
#' }
#'
#' See section 3.10.8, "Tempo and Beat Resolution", for details about how
#' time is handled in MIDI files.
#' @examples
#' \dontrun{
#'   print(midi_file_object <- mydough::new_midi_file())
#' }
#' @references
#' \insertRef{midoMidoMIDI}{mydough}
#'

new_midi_file <- function(type = 1, ticks_per_beat = 480) {
  reticulate::use_condaenv("mydough")
  mido <- reticulate::import("mido")
  midi_file_object <- mido$MidiFile()
  midi_file_object$type <- as.integer(type)
  midi_file_object$ticks_per_beat <- as.integer(ticks_per_beat)

  return(midi_file_object)
}
