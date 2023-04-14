#' @title Install `mido`
#' @name install_mido
#' @description Creates a `mydough` conda environment and installs `mido` in it.
#' `Miniconda` will be installed if necessary.
#' @export install_mido
#' @importFrom reticulate conda_binary
#' @importFrom reticulate install_miniconda
#' @returns the full path to the file

install_mido <- function() {
  conda_installed <- try(reticulate::conda_binary(), silent = TRUE)
  if (inherits(conda_installed, "try-error")) {
    cat("\n'reticulate::conda_binary()' could not find 'conda'.\n")
    cat("'Miniconda' will be installed in the default location.\n")
    install_succeeded <- try(reticulate::install_miniconda(), silent = TRUE)
    if (inherits(install_succeeded, "try-error")) {
      stop("'Miniconda install failed - cannot continue!")
    }
    cat("\n'Miniconda' install successful.\n")
  }

  conda_binary_path <- reticulate::conda_binary()
  cat("\n'reticulate::conda_binary()' returned ", conda_binary_path, "\n")
}
