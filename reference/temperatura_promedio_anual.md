# Calcular el promedio anual de temperatura de abrigo a 150 cm por estación

Extrae el año a partir de la fecha, agrupa los datos por identificador
de estación y año, y calcula la temperatura de abrigo promedio a 150 cm.

## Usage

``` r
temperatura_promedio_anual(datos)
```

## Arguments

- datos:

  Un `data.frame` que contenga las columnas `fecha`, `id` y
  `temperatura_abrigo_150cm`.

## Value

Un `tbl_df` (tibble) con una fila por estación y año, y las siguientes
columnas calculadas:

- id:

  Identificador de la estación

- anio:

  Año de las observaciones

- temp_promedio:

  Temperatura promedio de abrigo a 150 cm (°C)

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
  promedio_anual <- temperatura_promedio_anual(datos_clima)
  print(promedio_anual)
} # }
```
