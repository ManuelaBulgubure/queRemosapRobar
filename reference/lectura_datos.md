# Lectura de datos meteorológicos por estación

Descarga un archivo CSV de datos meteorológicos desde el repositorio de
Github si éste no existe localmente en la ruta especificada y retorna un
`tbl_df` con los datos.

## Usage

``` r
lectura_datos(id, ruta = paste0(id, ".csv"))
```

## Arguments

- id:

  cadena de texto con el identificador de cada estación (por ejemplo,
  `"NH0437"`). Se usa para armar la dirección de descarga, ya que el
  archivo remoto se llama como el identificador seguido de `".csv"`.
  Distingue mayúsculas de minúsculas.

- ruta:

  cadena de texto con la ruta local (incluyendo el nombre del archivo)
  donde se desea leer/instalar el CSV. Por defecto es
  `paste0(id, ".csv")`, es decir, un archivo en la carpeta de trabajo.

## Value

Un dataframe con los datos de la estación indicada.

## Examples

``` r
if (FALSE) { # \dontrun{
  datos_nh0437 <- lectura_datos(id = "NH0437", ruta = "NH0437.csv")
} # }
```
