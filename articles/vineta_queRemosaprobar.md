# Introducción al paquete queRemosaprobar

## Introducción

El paquete `queRemosaprobar` proporciona herramientas para la lectura,
estructuración, análisis y visualización de datos meteorológicos
provenientes de estaciones de medición. Esta viñeta muestra un flujo de
trabajo básico utilizando las funciones principales del paquete:

1.  Lectura e importación de datos desde GitHub.
2.  Cálculo de resúmenes estadísticos de temperatura.
3.  Visualización de la evolución mensual de temperatura por estación.

### Lectura e Importación de Datos

La función lectura_datos() permite descargar e importar un archivo CSV
con mediciones climáticas a partir del identificador de la estación. Si
el archivo ya existe en tu equipo local, lo lee directamente.

``` r

# Ejemplo de lectura para la estación "nh0437"
datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")

# Inspección básica de los datos cargados
head(datos_clima)
```

### Resumen Estadístico de Temperatura

Con la función
[`tabla_resumen_temperatura()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/tabla_resumen_temperatura.md),
podemos obtener una tabla agrupada por estación (`id`) que calcula la
temperatura promedio, mínima y máxima (a 150 cm de altura):

``` r

# Cálculo de tabla resumen
resumen_temp <- tabla_resumen_temperatura(datos_clima)

# Mostrar el resultado
resumen_temp
```

### Visualización de la Evolución Mensual

Para analizar el comportamiento temporal de la temperatura a lo largo
del año, utilizamos
[`grafico_temperatura_mensual()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/grafico_temperatura_mensual.md).
Esta función genera un gráfico de líneas interactivo construido sobre
`ggplot2`.

``` r

# Generar el gráfico mensual de la estación
grafico_temperatura_mensual(
  data_frame = datos_clima, 
  titulo = "Evolución Mensual de Temperatura - Estación NH0437"
)
```
