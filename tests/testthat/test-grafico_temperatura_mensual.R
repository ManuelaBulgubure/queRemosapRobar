test_that("grafico_temperatura_mensual maneja colores NULL correctamente", {
  expect_true(is.object(grafico_temperatura_mensual(data.frame(id = "nh0437", fecha = as.Date("2023-01-10"), temperatura_abrigo_150cm = 20), colores = NULL)))
})


test_that("grafico_temperatura_mensual acepta colores personalizados", {
  expect_true(is.object(grafico_temperatura_mensual(data.frame(id = "nh0437", fecha = as.Date("2023-01-10"), temperatura_abrigo_150cm = 20), colores = c("blue"))))
})


test_that("grafico_temperatura_mensual acepta título personalizado", {
  expect_true(is.object(grafico_temperatura_mensual(data.frame(id = "nh0437", fecha = as.Date("2023-01-10"), temperatura_abrigo_150cm = 20), titulo = "Mi Gráfico")))
})


test_that("grafico_temperatura_mensual da error con datos vacíos", {
  expect_error(grafico_temperatura_mensual(data.frame()))
})
