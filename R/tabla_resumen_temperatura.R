#' Tabla resumen temperatura por estación
#'
#' Calcula la temperatura promedio, mínima y máxima (a 150cm) de cada estación
#'
#' @param datos Un dataframe que contenga al menos las columnas "id" g "temperatura_abrigo_150cm"
#'
#' @return Un dataframe (resumen) con una fila por estación (identificada por su ID)
#' y las siguientes columnas calculadas:
#'  \item{id}{Identificador de la estación}
#'  \item{temp_promedio}{Temperatura promedio (°C)}
#'  \item{temp_minima}{Temperatura mínima registrada (°C)}
#'  \item{temp_maxima}{Temperatura máxima registrada (°C)}
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   resumen_temp <- tabla_resumen_temperatura(datos_clima)
#'   head(resumen_temp)
#' }


tabla_resumen_temperatura <- function(datos){
  resumen <- datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      temp_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      temp_minima = min(temperatura_abrigo_150cm, na.rm = TRUE),
      temp_maxima = max(temperatura_abrigo_150cm, na.rm = TRUE)
    )
  return(resumen)
}
