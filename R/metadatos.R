#' Metadatos de las estaciones meteorológicas
#'
#' Un conjunto de datos que contiene información descriptiva, ubicación geográfica
#' y período de registro de las distintas estaciones meteorológicas.
#'
#' @format Un data frame con las siguientes 11 variables:
#' \describe{
#'   \item{id}{Identificador único de la estación.}
#'   \item{nombre}{Nombre descriptivo de la estación.}
#'   \item{tipo}{Tipo o categoría de la estación (por ejemplo, Nimbus THP).}
#'   \item{localidad}{Localidad o ciudad de referencia.}
#'   \item{provincia}{Provincia correspondiente.}
#'   \item{lat}{Coordenada de latitud.}
#'   \item{lon}{Coordenada de longitud.}
#'   \item{altura}{Altura o elevación de la estación.}
#'   \item{ubicacion}{Descripción detallada o referencias de la ubicación (como rutas o km).}
#'   \item{desde}{Fecha de inicio de los registros (formato de fecha y hora UTC).}
#'   \item{hasta}{Fecha de cierre o última actualización de los registros.}
#' }
#' @source Datos provistos por la cátedra / fuentes académicas.

"metadatos"
