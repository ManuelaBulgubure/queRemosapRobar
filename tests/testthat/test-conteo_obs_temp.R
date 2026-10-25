test_that("conteo_obs_temp() calcula correctamente los valores no nulos por id", {

  # 1. Simulamos un dataset con valores nulos y no nulos para probar la función
  # Se utiliza data.frame() para crear el dataframe, y asignamos vectores a los valores
  # de cada columna

  datos_prueba1 <- data.frame(
    id = c("Estacion_1", "Estacion_2", "Estacion_3"),
    temperatura_abrigo_150cm = c(20.5, NA, 22.1),
    temperatura_inte_5cm = c(NA, 18.2, 19.0),
    temperatura_suelo_10cm_media = c(15.0, 14.5, NA)
  )

  # 2. Ejecutamos la función
  resultado1 <- conteo_obs_temp(datos_prueba1)

  # 3. Verificamos que los conteos sean correctos grupo (se cuentan los no NA)

  # Estacion_1: 1 valor no NA en 150cm, 1 valor NA en 5cm, 1 valor no NA en 10cm
  est1 <- resultado1 |> dplyr::filter(id == "Estacion_1")
  expect_equal(est1$temp_150cm, 1)
  expect_equal(est1$temp_5cm, 0)
  expect_equal(est1$temp_10cm_media, 1)

  # Estacion_2: 1 valor NA en 150cm, 1 valor no NA en 5cm, 1 valor no NA en 10cm
  est2 <- resultado1 |> dplyr::filter(id == "Estacion_2")
  expect_equal(est2$temp_150cm, 0)
  expect_equal(est2$temp_5cm, 1)
  expect_equal(est2$temp_10cm_media, 1)

  # Estacion_3: 1 valor no NA en 150cm, 1 valor no NA en 5cm, 1 valor NA en 10cm
  est3 <- resultado1 |> dplyr::filter(id == "Estacion_3")
  expect_equal(est3$temp_150cm, 1)
  expect_equal(est3$temp_5cm, 1)
  expect_equal(est3$temp_10cm_media, 0)
})

test_that("conteo_obs_temp() devuelve un data frame", {

  datos_prueba2 <- data.frame(
    id = "Estacion_x",
    temperatura_abrigo_150cm = 20.8,
    temperatura_inte_5cm = 18.1,
    temperatura_suelo_10cm_media = 14.0
  )

  resultado2 <- conteo_obs_temp(datos_prueba2)
  expect_s3_class(resultado2, "data.frame")
})

test_that("el dataframe que devuelve conteo_obs_temp() tiene las columnas esperadas", {
  datos_prueba3 <- data.frame(
    id = "Estacion_y",
    temperatura_abrigo_150cm = 11.2,
    temperatura_inte_5cm = 9.0,
    temperatura_suelo_10cm_media = 13.4
  )
  resultado3 <- conteo_obs_temp(datos_prueba3)
  expect_named(resultado3, c("id", "temp_150cm", "temp_5cm", "temp_10cm_media"))
})
