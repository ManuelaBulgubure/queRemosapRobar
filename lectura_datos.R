#' Lectura de datos meteorológicos por estación
#'
#' Descarga un archivo CSV de datos meteorológicos desde el respositorio de Github
#' si éste no existe localmente en la ruta especificada y retorna un \code{tbl_df} con los datos.
#'
#' @param id cadena de texto con el identificador de cada estación
#' @param ruta cadena de texto con la ruta local (incluyendo el nombre del archivo)
#' donde se desea leer/instalar el CSV
#'
#' @returns Un \code{\link[readr]{read_csv}} data frame (\code{tbl_df}) con los datos de la estación.
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_nh0437 <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#' }


lectura_datos <- function(id, ruta){
  url_estacion <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", id, ".csv")
  if(!file.exists(ruta)){
    cli::cli_inform("El archivo no fue encontrado")
    download.file(url = url_estacion, destfile = ruta)
  } else{
    cli::cli_inform("El archivo ya existe en tu computadora")
  }
  datos <- readr::read_csv(ruta)
  return(datos)
}
