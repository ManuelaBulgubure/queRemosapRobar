#' Graficar la temperatura promedio mensual por estación
#'
#' @param data_frame Un dataframe con al menos las columnas "fecha",
#' "id" y "temperatura_abrigo_150cm".
#' @param colores vector (opcional) de caracteres con colores para cada estación.
#' Si no se especifican suficientes colores, se eligen de forma aleatoria.
#' @param titulo Será el título del gráfico (cadena de caracteres).
#' Por default es "Temperatura"
#'
#' @returns Un gráfico hecho con ggplot con la línea de evolución mensual por estación
#' @export
#'
#' @examples
#' \dontrun{
#'   datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
#'   grafico_temperatura_mensual(datos_clima, titulo = "Evolución Mensual NH0437")
#' }

grafico_temperatura_mensual <- function(data_frame, colores = NULL, titulo = "Temperatura") {

  promedio_temp <- data_frame |>
    mutate(mes = month(fecha)) |>
    group_by(id, mes) |>
    summarise(
      prom_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Si no se pasan colores (o faltan), se eligen aleatoriamente de colors()
  n_id <- n_distinct(promedio_temp$id)
  if (is.null(colores) || length(colores) < n_id) {
    colores <- sample(colors(), n_id)
  }

  ggplot(data = promedio_temp, mapping = aes(x = mes, y = prom_temp, color = as.character(id))) +
    #el as.character(id) le indica a ggplot2 que id es una categoría y no una medición numérica. Permite que scale_color_manual(values = colores) asigne un color individual y distinto a cada estación.
    geom_line() +
    scale_color_manual(values = colores) +
    labs(
      title = titulo,
      x = "Mes",
      y = "Promedio temperatura (°C)",
      color = "Estación"
    )
}
