# queRemosapRobar

El objetivo principal del paquete **queRemosapRobar** es proporcionar un
conjunto robusto y estructurado de herramientas en R para la lectura, el
procesamiento, el análisis estadístico y la visualización de datos
meteorológicos provenientes de diversas estaciones de medición.

Este paquete fue desarrollado con fines académicos en el marco de la
asignatura **Programación II**, aplicando buenas prácticas de desarrollo
de software en R (documentación con Roxygen2, viñetas y control de
versiones con Git/GitHub).

## Instalación

Podés instalar la versión en desarrollo de **queRemosapRobar**
directamente desde GitHub ejecutando las siguientes líneas en tu consola
de R:

Con el paquete `pak`:

``` r

install.packages("pak")
pak::pak("ManuelaBulgubure/queRemosapRobar")
```

O utilizando `devtools`:

``` r

install.packages("devtools")
devtools::install_github("ManuelaBulgubure/queRemosapRobar")
```

## Flujo de trabajo y funciones principales

El paquete cuenta con un flujo de trabajo integrado diseñado para
acompañarte desde la importación inicial de los datos climáticos hasta
la generación de gráficos analíticos detallados.

Para comenzar a utilizar las funciones, primero cargamos la librería:

``` r

library(queRemosapRobar)
```

### 1. Lectura e importación de datos (`lectura_datos`)

La función
[`lectura_datos()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/lectura_datos.md)
permite descargar e importar de forma automatizada un archivo CSV con
mediciones climáticas a partir del identificador de la estación. Si el
archivo ya se encuentra disponible en tu entorno local, lo lee
directamente desde el disco:

``` r

# Ejemplo de importación para la estación "nh0437"
datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")

# Inspección preliminar de los datos cargados
head(datos_clima)
```

### 2. Conteo de observaciones de temperatura por estación (`conteo_obs_temp`)

Se recomienda utilizar la función
[`conteo_obs_temp()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/conteo_obs_temp.md)
para contabilizar los registros válidos de distintas temperaturas
agrupadas por estación:

``` r

# Realizar el conteo de observaciones no nulas
conteo_obs <- conteo_obs_temp(datos_clima)

# Mostrar el resultado en consola
conteo_obs
```

### 3. Resumen estadístico de temperatura (`tabla_resumen_temperatura`)

Utilizando la función
[`tabla_resumen_temperatura()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/tabla_resumen_temperatura.md),
es posible obtener una tabla estructurada y agrupada por estación (`id`)
que calcula automáticamente la temperatura promedio, mínima y máxima a
150 cm de altura:

``` r

# Cálculo de la tabla resumen estadística
resumen_temp <- tabla_resumen_temperatura(datos_clima)

# Mostrar el resultado en consola
resumen_temp
```

### 4. Extremos de temperatura por estación (`extremos_temperatura_estacion`)

Se utiliza
[`extremos_temperatura_estacion()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/extremos_temperatura_estacion.md)
para calcular de forma rápida los valores mínimos y máximos a cada
altura/profundidad registrados en cada estación.

``` r

# Cálculo de valores mínimos y máximos
resumen_extremos <- extremos_temperatura_estacion(datos_clima)

# Mostrar el resultado en consola
resumen_extremos
```

### 5. Temperatura promedio anual por estación (`temperatura_promedio_anual`)

La función
[`temperatura_promedio_anual()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/temperatura_promedio_anual.md)
devuelve una tabla que contiene la estación, el año de registro y la
temperatura promedio de abrigo a 150 cm correspondiente.

``` r

# Cálculo de temperatura promedio según estación y año
temp_promedio <- temperatura_promedio_anual(datos_clima)

# Mostrar el resultado en consola
temp_promedio
```

### 6. Visualización de la evolución mensual (`grafico_temperatura_mensual`)

Para analizar el comportamiento temporal y las tendencias de la
temperatura a lo largo del año, utilizamos
[`grafico_temperatura_mensual()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/grafico_temperatura_mensual.md).
Esta función genera una visualización gráfica clara y estéticamente
cuidada construida sobre `ggplot2`:

``` r

# Generación del gráfico mensual para la estación
grafico_temperatura_mensual(
  data_frame = datos_clima,
  titulo = "Evolución Mensual de Temperatura - Estación NH0437"
)
```

## Viñeta de introducción

Si querés profundizar en los conceptos, ver más ejemplos prácticos y
entender en detalle la arquitectura del paquete, podés consultar la
viñeta integrada ejecutando el siguiente comando en tu consola de R:

``` r

vignette("vineta_queRemosapRobar", package = "queRemosapRobar")
```

## Autores y contribuciones

Este proyecto fue desarrollado de forma colaborativa por estudiantes de
la cátedra de Programación II:

- Manuela Bulgubure
- Paulina Guerscovich
