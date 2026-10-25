#' Conteo de observaciones de temperatura por estación
#'
#' Calcula la cantidad de observaciones registradas (no nulas) de temperatura
#' a diferentes alturas o profundidades agrupadas por el id de cada estación
#'
#' @param datos un \code{data.frame} que debe contener la columna
#' \code{id} y las variables de temperatura correspondientes
#'
#' @return Un \code{tbl_df} (tibble) con una fila por estación (\code{id}) y las
#' siguientes columnas calculadas:
#'   \item{id}{Identificador de la estación}
#'   \item{temp_150cm}{Cantidad de observaciones válidas a 150 cm}
#'   \item{temp_5cm}{Cantidad de observaciones válidas a 5 cm}
#'   \item{temp_10cm_media}{Cantidad de observaciones válidas a 10 cm de profundidad}
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   conteo <- conteo_observaciones_temperatura(datos_clima)
#'   print(conteo)
#' }
#'
conteo_obs_temp <- function(datos){
  resumen_conteo <- datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      temp_150cm = sum(!is.na(temperatura_abrigo_150cm)),
      temp_5cm = sum(!is.na(temperatura_inte_5cm)),
      temp_10cm_media = sum(!is.na(temperatura_suelo_10cm_media))
    )
  return(resumen_conteo)
}
