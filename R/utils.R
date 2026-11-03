# Funciones internas (no exportadas) de uso común en el paquete.

#' Mínimo que devuelve NA cuando no hay datos
#'
#' Igual que \code{min(x, na.rm = TRUE)}, pero si todos los valores son
#' \code{NA} devuelve \code{NA} en lugar de \code{Inf} (y evita el warning).
#'
#' @param x Vector numérico.
#' @return Un número, o \code{NA_real_} si \code{x} no tiene valores válidos.
#' @noRd
minimo_seguro <- function(x) {
  if (all(is.na(x))) {
    return(NA_real_)
  }
  min(x, na.rm = TRUE)
}

#' Máximo que devuelve NA cuando no hay datos
#'
#' Igual que \code{max(x, na.rm = TRUE)}, pero si todos los valores son
#' \code{NA} devuelve \code{NA} en lugar de \code{-Inf} (y evita el warning).
#'
#' @param x Vector numérico.
#' @return Un número, o \code{NA_real_} si \code{x} no tiene valores válidos.
#' @noRd
maximo_seguro <- function(x) {
  if (all(is.na(x))) {
    return(NA_real_)
  }
  max(x, na.rm = TRUE)
}
