# Calcular temperaturas extremas (mínimas y máximas) por estación

Calcula las temperaturas mínimas y máximas registradas a distintas
alturas o profundidades, agrupadas por el identificador de cada
estación. Si una estación no tiene ningún valor válido en una variable,
el resultado para esa variable es `NA`.

## Usage

``` r
extremos_temperatura_estacion(datos)
```

## Arguments

- datos:

  Un `data.frame` con la columna `id` y las variables de temperatura
  correspondientes.

## Value

Un `tbl_df` (tibble) con una fila por estación (`id`) y las siguientes
columnas calculadas:

- id:

  Identificador de la estación

- temp_minima_150cm:

  Temperatura mínima a 150 cm

- temp_maxima_150cm:

  Temperatura máxima a 150 cm

- temp_minima_50cm:

  Temperatura mínima a 50 cm en intemperie

- temp_minima_5cm:

  Temperatura mínima a 5 cm en intemperie

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id =    "NH0437", ruta = "NH0437.csv")
  extremos <- extremos_temperatura_estacion(datos_clima)
  print(extremos)
} # }
```
