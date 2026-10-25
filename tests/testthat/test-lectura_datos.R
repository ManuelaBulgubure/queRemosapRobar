test_that("lectura_datos retorna un dataframe", {
  expect_true(is.data.frame(lectura_datos(id = "NH0437", ruta = "NH0437.csv")))
})


test_that("lectura_datos el archivo descargado no está vacío", {
  expect_true(nrow(lectura_datos(id = "NH0437", ruta = "NH0437.csv")) > 0)
})


test_that("lectura_datos da error con un ID inexistente", {
  expect_error(lectura_datos(id = "id_falso_999", ruta = "falso.csv"))
})
