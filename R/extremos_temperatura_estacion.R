#' Calcular temperaturas extremas (mínimas y máximas) por estación
#'
#' Calcula las temperaturas mínimas y máximas registradas a distintas alturas
#' o profundidades, agrupadas por el identificador de cada estación.
#'
#' @param datos Un \code{data.frame} con la columna
#'   \code{id} y las variables de temperatura correspondientes.
#'
#' @return Un \code{tbl_df} (tibble) con una fila por estación (\code{id}) y las
#'   siguientes columnas calculadas:
#'   \item{id}{Identificador de la estación}
#'   \item{temp_minima_150cm}{Temperatura mínima a 150 cm}
#'   \item{temp_maxima_150cm}{Temperatura máxima a 150 cm}
#'   \item{temp_minima_50cm}{Temperatura mínima a 50 cm en intemperie}
#'   \item{temp_minima_5cm}{Temperatura mínima a 5 cm}
#'
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   extremos <- extremos_temperatura_estacion(datos_clima)
#'   print(extremos)
#' }

extremos_temperatura_estacion <- function(datos) {
  resumen_extremos <- datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      temp_minima_150cm = min(temperatura_abrigo_150cm_minima, na.rm = TRUE),
      temp_maxima_150cm = max(temperatura_abrigo_150cm_maxima, na.rm = TRUE),
      temp_minima_50cm  = min(temperatura_intemperie_50cm_minima, na.rm = TRUE),
      temp_minima_5cm   = min(temperatura_inte_5cm, na.rm = TRUE)
    )

  return(resumen_extremos)
}
