test_that("temperatura_promedio_anual() calcula correctamente los promedios anuales y maneja NAs", {

  # Simulamos datos con diferentes años, valores válidos y un año con puro NA
  datos_prueba <- data.frame(
    id = c("Est_1", "Est_1", "Est_1", "Est_2", "Est_3"),
    fecha = as.Date(c("2022-01-10", "2022-06-20", "2023-03-05", "2023-04-10", "2023-05-12")),
    temperatura_abrigo_150cm = c(10, 20, NA, 15, NA)
  )

  resultado <- temperatura_promedio_anual(datos_prueba)

  # 1. Est_1 en el 2022 tiene 10 y 20 -> promedio = 15
  est1_2022 <- resultado |> dplyr::filter(id == "Est_1" & anio == 2022)
  expect_equal(est1_2022$temp_promedio, 15)

  # 2. Est_2 en el 2023 tiene un único valor: 15 -> promedio = 15
  est2_2023 <- resultado |> dplyr::filter(id == "Est_2" & anio == 2023)
  expect_equal(est2_2023$temp_promedio, 15)

  # 3. Est_3 en el 2023 tiene únicamente un NA -> el promedio debe ser NaN
  est3_2023 <- resultado |> dplyr::filter(id == "Est_3" & anio == 2023)
  expect_true(is.nan(est3_2023$temp_promedio))
})

test_that("temperatura_promedio_anual() devuelve un data frame", {
  datos_prueba <- data.frame(
    id = "Estacion_x",
    fecha = as.Date("2023-01-15"),
    temperatura_abrigo_150cm = 20.0
  )

  resultado <- temperatura_promedio_anual(datos_prueba)
  expect_s3_class(resultado, "data.frame")
})

test_that("temperatura_promedio_anual() tiene las columnas esperadas", {
  datos_prueba <- data.frame(
    id = "Estacion_x",
    fecha = as.Date("2023-01-15"),
    temperatura_abrigo_150cm = 20.0
  )

  resultado <- temperatura_promedio_anual(datos_prueba)
  expect_named(resultado, c("id", "anio", "temp_promedio"))
})
