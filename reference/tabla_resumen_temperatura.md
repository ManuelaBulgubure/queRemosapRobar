# Tabla resumen temperatura por estación

Calcula la temperatura promedio, mínima y máxima (a 150cm) de cada
estación. Si una estación no tiene ningún valor válido, la mínima y la
máxima se devuelven como `NA`.

## Usage

``` r
tabla_resumen_temperatura(datos)
```

## Arguments

- datos:

  Un dataframe que contenga al menos las columnas "id" y
  "temperatura_abrigo_150cm"

## Value

Un dataframe (resumen) con una fila por estación (identificada por su
ID) y las siguientes columnas calculadas:

- id:

  Identificador de la estación

- temp_promedio:

  Temperatura promedio (°C)

- temp_minima:

  Temperatura mínima registrada (°C)

- temp_maxima:

  Temperatura máxima registrada (°C)

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_clima <- lectura_datos(id = "NH0437", ruta = "NH0437.csv")
  resumen_temp <- tabla_resumen_temperatura(datos_clima)
  head(resumen_temp)
} # }
```
