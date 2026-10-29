# Graficar la temperatura promedio mensual por estacion

Graficar la temperatura promedio mensual por estacion

## Usage

``` r
grafico_temperatura_mensual(data_frame, colores = NULL, titulo = "Temperatura")
```

## Arguments

- data_frame:

  Un dataframe con al menos las columnas "fecha", "id" y
  "temperatura_abrigo_150cm".

- colores:

  vector (opcional) de caracteres con colores para cada estacion. Si no
  se especifican suficientes colores, se eligen de forma aleatoria.

- titulo:

  Sera el titulo del grafico (cadena de caracteres). Por default es
  "Temperatura"

## Value

Un grafico hecho con ggplot con la linea de evolucion mensual por
estacion

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
  grafico_temperatura_mensual(datos_clima, titulo = "Evolucion Mensual NH0437")
} # }
```
