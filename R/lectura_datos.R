#' Lectura de datos meteorológicos por estación
#'
#' Descarga un archivo CSV de datos meteorológicos desde el repositorio de Github
#' si éste no existe localmente en la ruta especificada y retorna un \code{tbl_df} con los datos.
#'
#' @param id cadena de texto con el identificador de cada estación (por ejemplo,
#' \code{"NH0437"}). Se usa para armar la dirección de descarga, ya que el archivo
#' remoto se llama como el identificador seguido de \code{".csv"}. Distingue
#' mayúsculas de minúsculas.
#' @param ruta cadena de texto con la ruta local (incluyendo el nombre del archivo)
#' donde se desea leer/instalar el CSV. Por defecto es \code{paste0(id, ".csv")},
#' es decir, un archivo en la carpeta de trabajo.
#'
#' @return Un dataframe con los datos de la estación indicada.
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_nh0437 <- lectura_datos(id =    "NH0437", ruta = "NH0437.csv")
#' }


lectura_datos <- function(id, ruta = paste0(id, ".csv")){
  if(!file.exists(ruta)){
    cli::cli_inform("El archivo no fue encontrado")
    utils::download.file(url = armar_url_estacion(id), destfile = ruta)
  } else{
    cli::cli_inform("El archivo ya existe en tu computadora")
  }
  datos <- readr::read_csv(ruta, show_col_types = FALSE)
  return(datos)
}

#' Dirección de descarga del CSV de una estación
#'
#' @param id Identificador de la estación.
#' @return Una cadena con la URL del archivo en el repositorio de datos.
#' @noRd
armar_url_estacion <- function(id) {
  paste0(
    "https://raw.githubusercontent.com/ManuelaBulgubure/intro-programacion/main/datos/",
    id, ".csv"
  )
}
