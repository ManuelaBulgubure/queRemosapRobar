test_that("tabla_resumen_temperatura agrupa correctamente por estación", {
  expect_equal(
    object = tabla_resumen_temperatura(data.frame(
      id = c("estacion_A", "estacion_A", "estacion_B", "estacion_B"),
      temperatura_abrigo_150cm = c(10, 20, 15, 25)
    )),
    expected = tibble::tibble(
      id = c("estacion_A", "estacion_B"),
      temp_promedio = c(15, 20),
      temp_minima = c(10, 15),
      temp_maxima = c(20, 25)
    )
  )
})



test_that("tabla_resumen_temperatura maneja valores NA correctamente", {
  expect_equal(
    object = tabla_resumen_temperatura(data.frame(
      id = c("nh0437", "nh0437"),
      temperatura_abrigo_150cm = c(10, NA)
    )),
    expected = tibble::tibble(
      id = "nh0437",
      temp_promedio = 10,
      temp_minima = 10,
      temp_maxima = 10
    )
  )
})



test_that("tabla_resumen_temperatura da error con datos vacíos", {
  expect_error(tabla_resumen_temperatura(data.frame()))
})
