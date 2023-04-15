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

  cat("\nCreating 'mydough' conda environment\n")
  reticulate::conda_create(envname = "mydough", packages = c(
    "python",
    "numpy",
    "mido"
  ))
  reticulate::use_condaenv("mydough")
  reticulate::py_discover_config()

}
