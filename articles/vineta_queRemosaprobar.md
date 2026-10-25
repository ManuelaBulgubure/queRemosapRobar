# Paquete meteorológico: queRemosapRobar

## Introducción

El paquete `queRemosapRobar` proporciona herramientas para la lectura,
estructuración, análisis y visualización de datos meteorológicos
provenientes de estaciones de medición. Esta viñeta muestra un flujo de
trabajo básico utilizando las funciones principales del paquete:

1.  **Lectura e Importación de Datos** (`lectura_datos`)
2.  **Conteo de Observaciones Válidas** (`conteo_obs_temp`)
3.  **Resumen Estadístico de Temperatura** (`tabla_resumen_temperatura`)
4.  **Temperaturas Extremas por Estación**
    (`extremos_temperatura_estacion`)
5.  **Temperatura Promedio Anual** (`temperatura_promedio_anual`)
6.  **Visualización de la Evolución Mensual**
    (`grafico_temperatura_mensual`)

### Lectura e Importación de Datos

La función
[`lectura_datos()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/lectura_datos.md)
permite descargar e importar un archivo CSV con mediciones climáticas a
partir del identificador de la estación. Si el archivo ya existe en tu
equipo local, lo lee directamente.

``` r

# Ejemplo de lectura para la estación "nh0437"
datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")

# Inspección básica de los datos cargados
head(datos_clima)
```

### Conteo de Observaciones Válidas

Para verificar la calidad y disponibilidad de los datos registrados a
distintas alturas o profundidades por cada estación, utilizamos la
función
[`conteo_obs_temp()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/conteo_obs_temp.md):

``` r

# Calcular el conteo de observaciones válidas
conteo_obs <- conteo_obs_temp(datos_clima)

# Mostrar el resultado
conteo_obs
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

### Temperaturas Extremas por Estación

La función
[`extremos_temperatura_estacion()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/extremos_temperatura_estacion.md)
permite identificar los valores mínimos y máximos absolutos registrados
a diferentes alturas, facilitando la detección de eventos térmicos
destacados:

``` r

# Cálculo de temperaturas extremas
extremos_estacion <- extremos_temperatura_estacion(datos_clima)

# Mostrar el resultado
extremos_estacion
```

### Temperatura Promedio Anual

Si nuestro objetivo es realizar un seguimiento a mayor escala temporal,
podemos extraer los años a partir de las fechas y calcular la
temperatura de abrigo promedio anual por estación mediante
[`temperatura_promedio_anual()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/temperatura_promedio_anual.md):

``` r

# Cálculo del promedio anual
promedio_anual <- temperatura_promedio_anual(datos_clima)

# Mostrar el resultado
promedio_anual
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
