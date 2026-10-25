# Conteo de observaciones de temperatura por estación

Calcula la cantidad de observaciones registradas (no nulas) de
temperatura a diferentes alturas o profundidades agrupadas por el id de
cada estación

## Usage

``` r
conteo_obs_temp(datos)
```

## Arguments

- datos:

  un `data.frame` que debe contener la columna `id` y las variables de
  temperatura correspondientes

## Value

Un `tbl_df` (tibble) con una fila por estación (`id`) y las siguientes
columnas calculadas:

- id:

  Identificador de la estación

- temp_150cm:

  Cantidad de observaciones válidas a 150 cm

- temp_5cm:

  Cantidad de observaciones válidas a 5 cm

- temp_10cm_media:

  Cantidad de observaciones válidas a 10 cm de profundidad

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
  conteo <- conteo_observaciones_temperatura(datos_clima)
  print(conteo)
} # }
```
