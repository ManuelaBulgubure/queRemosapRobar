test_that("extremos_temperatura_estacion() calcula correctamente los extremos ignorando NAs", {

  # Simulamos un dataset con múltiples estaciones, valores y algunos valores faltantes
  datos_prueba <- data.frame(
    id = c("Estacion_1", "Estacion_1", "Estacion_2", "Estacion_2"),
    temperatura_abrigo_150cm_minima = c(10, NA, 12, 14),
    temperatura_abrigo_150cm_maxima = c(NA, 25, 28, 30),
    temperatura_intemperie_50cm_minima = c(8, 6, NA, 9),
    temperatura_inte_5cm = c(5, 4, 6, NA)
  )

  resultado <- extremos_temperatura_estacion(datos_prueba)

  # Estacion_1
  # En temperatura_abrigo_150cm_minima: (10, NA) -> 10 (el mínimo)
  # En temperatura_abrigo_150cm_maxima: (NA, 25) -> 25 (el máximo)
  # En temperatura_intemperie_50cm_minima: (8, 6) -> 6 (el mínimo)
  # En temperatura_inte_5cm: (5, 4) -> 4 (el mínimo)

  est1 <- resultado |> dplyr::filter(id == "Estacion_1")
  expect_equal(est1$temp_minima_150cm, 10)
  expect_equal(est1$temp_maxima_150cm, 25)
  expect_equal(est1$temp_minima_50cm, 6)
  expect_equal(est1$temp_minima_5cm, 4)

  # Estacion_2
  # En temperatura_abrigo_150cm_minima: (12, 14) -> 12 (el mínimo)
  # En temperatura_abrigo_150cm_maxima: (28, 30) -> 30 (el máximo)
  # En temperatura_intemperie_50cm_minima: (NA, 9) -> 9 (el mínimo)
  # En temperatura_inte_5cm: (6, NA) -> 6 (el mínimo)

  est2 <- resultado |> dplyr::filter(id == "Estacion_2")
  expect_equal(est2$temp_minima_150cm, 12)
  expect_equal(est2$temp_maxima_150cm, 30)
  expect_equal(est2$temp_minima_50cm, 9)
  expect_equal(est2$temp_minima_5cm, 6)
})

test_that("extremos_temperatura_estacion() devuelve un data frame", {
  datos_prueba <- data.frame(
    id = "Estacion_x",
    temperatura_abrigo_150cm_minima = 10,
    temperatura_abrigo_150cm_maxima = 25,
    temperatura_intemperie_50cm_minima = 8,
    temperatura_inte_5cm = 5
  )

  resultado <- extremos_temperatura_estacion(datos_prueba)
  expect_s3_class(resultado, "data.frame")
})


test_that("extremos_temperatura_estacion() tiene las columnas esperadas", {
  datos_prueba <- data.frame(
    id = "Estacion_x",
    temperatura_abrigo_150cm_minima = 10,
    temperatura_abrigo_150cm_maxima = 25,
    temperatura_intemperie_50cm_minima = 8,
    temperatura_inte_5cm = 5
  )

  resultado <- extremos_temperatura_estacion(datos_prueba)
  expect_named(
    resultado,
    c("id", "temp_minima_150cm", "temp_maxima_150cm", "temp_minima_50cm", "temp_minima_5cm")
  )
})
