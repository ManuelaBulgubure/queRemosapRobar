test_that("lectura_datos retorna un dataframe", {
  expect_true(is.data.frame(lectura_datos(id = "NH0437", ruta = "NH0437.csv")))
})


test_that("lectura_datos el archivo descargado no está vacío", {
  expect_true(nrow(lectura_datos(id = "NH0437", ruta = "NH0437.csv")) > 0)
})


test_that("lectura_datos usa el id como nombre de archivo por defecto", {
  # Sin indicar ruta, busca "NH0437.csv" en la carpeta de trabajo
  expect_true(is.data.frame(lectura_datos(id = "NH0437")))
})


test_that("armar_url_estacion arma la dirección a partir del id", {
  url <- armar_url_estacion("NH0437")
  expect_match(url, "^https://raw\\.githubusercontent\\.com/")
  expect_match(url, "NH0437\\.csv$")
})


test_that("lectura_datos da error con un ID inexistente", {
  expect_error(
    suppressWarnings(
      lectura_datos(id = "id_falso_999", ruta = tempfile(fileext = ".csv"))
    )
  )
})
