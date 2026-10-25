#' Calcular el promedio anual de temperatura de abrigo a 150 cm por estación
#'
#' Extrae el año a partir de la fecha, agrupa los datos por identificador de estación
#' y año, y calcula la temperatura de abrigo promedio a 150 cm.
#'
#' @param datos Un \code{data.frame} que contenga las
#'   columnas \code{fecha}, \code{id} y \code{temperatura_abrigo_150cm}.
#'
#' @return Un \code{tbl_df} (tibble) con una fila por estación y año, y las
#'   siguientes columnas calculadas:
#'   \item{id}{Identificador de la estación}
#'   \item{anio}{Año de las observaciones}
#'   \item{temp_promedio}{Temperatura promedio de abrigo a 150 cm (°C)}
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   promedio_anual <- temperatura_promedio_anual(datos_clima)
#'   print(promedio_anual)
#' }

temperatura_promedio_anual <- function(datos) {
  resumen_anual <- datos |>
    dplyr::mutate(anio = lubridate::year(fecha)) |>
    dplyr::group_by(id, anio) |>
    dplyr::summarise(
      temp_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  return(resumen_anual)
}
