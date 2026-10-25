# Graficar la temperatura promedio mensual por estación

Graficar la temperatura promedio mensual por estación

## Usage

``` r
grafico_temperatura_mensual(data_frame, colores = NULL, titulo = "Temperatura")
```

## Arguments

- data_frame:

  Un dataframe con al menos las columnas "fecha", "id" y
  "temperatura_abrigo_150cm".

- colores:

  vector (opcional) de caracteres con colores para cada estación. Si no
  se especifican suficientes colores, se eligen de forma aleatoria.

- titulo:

  Será el título del gráfico (cadena de caracteres). Por default es
  "Temperatura"

## Value

Un gráfico hecho con ggplot con la línea de evolución mensual por
estación

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
  grafico_temperatura_mensual(datos_clima, titulo = "Evolución Mensual NH0437")
} # }
```
