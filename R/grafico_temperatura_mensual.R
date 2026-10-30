#' Graficar la temperatura promedio mensual por estaci\u00f3n
#'
#' @param data_frame Un dataframe con al menos las columnas "fecha",
#' "id" y "temperatura_abrigo_150cm".
#' @param colores vector (opcional) de caracteres con colores para cada estaci\u00f3n.
#' Si no se especifican suficientes colores, se eligen de forma aleatoria.
#' @param titulo Ser\u00e1 el t\u00edtulo del gr\u00e1fico (cadena de caracteres).
#' Por default es "Temperatura"
#'
#' @return Un gr\u00e1fico hecho con ggplot con la l\u00ednea de evoluci\u00f3n mensual por estaci\u00f3n
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   grafico_temperatura_mensual(datos_clima, titulo = "Evoluci\u00f3n Mensual NH0437")
#' }

grafico_temperatura_mensual <- function(data_frame, colores = NULL, titulo = "Temperatura") {

  # Declaramos la variable global para evitar el NOTE del check
  utils::globalVariables("prom_temp")

  promedio_temp <- data_frame |>
    dplyr::mutate(mes = lubridate::month(fecha)) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(
      prom_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Si no se pasan colores (o faltan), se eligen aleatoriamente de colors()
  n_id <- dplyr::n_distinct(promedio_temp$id)

  if (is.null(colores) || length(colores) < n_id) {
    colores <- sample(grDevices::colors(), n_id)
  }

  ggplot2::ggplot(
    data = promedio_temp,
    mapping = ggplot2::aes(x = mes, y = prom_temp, color = as.character(id))) +
    # el as.character(id) le indica a ggplot2 que id es una categor\u00eda y no una medici\u00f3n num\u00e9rica.
    # Permite que scale_color_manual(values = colores) asigne un color individual y distinto a cada estaci\u00f3n.
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Promedio temperatura (grados (\u00b0C))",
      color = "Estaci\u00f3n"
    )
}
