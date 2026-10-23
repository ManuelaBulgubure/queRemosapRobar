# Lectura de datos meteorológicos por estación

Descarga un archivo CSV de datos meteorológicos desde el respositorio de
Github si éste no existe localmente en la ruta especificada y retorna un
`tbl_df` con los datos.

## Usage

``` r
lectura_datos(id, ruta)
```

## Arguments

- id:

  cadena de texto con el identificador de cada estación

- ruta:

  cadena de texto con la ruta local (incluyendo el nombre del archivo)
  donde se desea leer/instalar el CSV

## Value

Un dataframe con los datos de la estación indicada.

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_nh0437 <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")
} # }
```
