
# queRemosapRobar <a href="https://manuelabulgubure.github.io/queRemosapRobar/"><img src="man/figures/logo.png" align="right" height="120" alt="queRemosapRobar website" /></a>

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![codecov](https://codecov.io/gh/ManuelaBulgubure/queRemosapRobar/graph/badge.svg?token=3VQZNREAKV)](https://codecov.io/gh/ManuelaBulgubure/queRemosapRobar)
[![R-CMD-check](https://github.com/ManuelaBulgubure/queRemosapRobar/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ManuelaBulgubure/queRemosapRobar/actions/workflows/R-CMD-check.yaml)

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

La función `lectura_datos()` permite descargar e importar de forma
automatizada un archivo CSV con mediciones climáticas a partir del
identificador de la estación. Si el archivo ya se encuentra disponible
en tu entorno local, lo lee directamente desde el disco:

``` r
# Ejemplo de importación para la estación "NH0437"
datos_clima <- lectura_datos(id = "NH0437", ruta = "NH0437.csv")

# Inspección preliminar de los datos cargados
head(datos_clima)
```

### 2. Conteo de observaciones de temperatura por estación (`conteo_obs_temp`)

Se recomienda utilizar la función `conteo_obs_temp()` para contabilizar
los registros válidos de distintas temperaturas agrupadas por estación:

``` r
# Realizar el conteo de observaciones no nulas
conteo_obs <- conteo_obs_temp(datos_clima)

# Mostrar el resultado en consola
conteo_obs
```

### 3. Resumen estadístico de temperatura (`tabla_resumen_temperatura`)

Utilizando la función `tabla_resumen_temperatura()`, es posible obtener
una tabla estructurada y agrupada por estación (`id`) que calcula
automáticamente la temperatura promedio, mínima y máxima a 150 cm de
altura:

``` r
# Cálculo de la tabla resumen estadística
resumen_temp <- tabla_resumen_temperatura(datos_clima)

# Mostrar el resultado en consola
resumen_temp
```

### 4. Extremos de temperatura por estación (`extremos_temperatura_estacion`)

Se utiliza `extremos_temperatura_estacion()` para calcular de forma
rápida los valores mínimos y máximos a cada altura/profundidad
registrados en cada estación.

``` r
# Cálculo de valores mínimos y máximos
resumen_extremos <- extremos_temperatura_estacion(datos_clima)

# Mostrar el resultado en consola
resumen_extremos
```

### 5. Temperatura promedio anual por estación (`temperatura_promedio_anual`)

La función `temperatura_promedio_anual()` devuelve una tabla que
contiene la estación, el año de registro y la temperatura promedio de
abrigo a 150 cm correspondiente.

``` r
# Cálculo de temperatura promedio según estación y año
temp_promedio <- temperatura_promedio_anual(datos_clima)

# Mostrar el resultado en consola
temp_promedio
```

### 6. Visualización de la evolución mensual (`grafico_temperatura_mensual`)

Para analizar el comportamiento temporal y las tendencias de la
temperatura a lo largo del año, utilizamos
`grafico_temperatura_mensual()`. Esta función genera una visualización
gráfica clara y estéticamente cuidada construida sobre `ggplot2`:

``` r
# Generación del gráfico mensual para la estación
grafico_temperatura_mensual(
  data_frame = datos_clima,
  titulo = "Evolución Mensual de Temperatura - Estación NH0437"
)
```

## Datos incluidos

El paquete incluye tres conjuntos de datos, disponibles apenas cargás la
librería:

| Objeto | Descripción |
|----|----|
| `metadatos` | Información descriptiva de 258 estaciones meteorológicas: nombre, tipo, localidad, provincia, coordenadas, altura y período de registro (11 variables). |
| `estacion_472` | Registros diarios de la estación `NH0472`: temperaturas, humedad, viento, precipitaciones, radiación y otras variables agrometeorológicas (35 variables). |
| `estacion_910` | Registros diarios de la estación `NH0910`, con las mismas 35 variables que `estacion_472`. |

Si bien `metadatos` describe todas las estaciones, el paquete solo
incluye los datos diarios de estas dos.

``` r
library(queRemosapRobar)

# Metadatos de las estaciones
head(metadatos)

# Datos diarios de una estación
head(estacion_472)
```

Para ver el detalle de cada variable, consultá `?metadatos`,
`?estacion_472` o `?estacion_910`.

### Ejemplo rápido de integración de datos

Si querés trabajar de forma conjunta con los datos diarios de distintas
estaciones y enriquecerlos con la información descriptiva, podés
combinar los datasets que comparten estructura con `rbind()` y luego
cruzarlos con los metadatos:

``` r
library(dplyr)
# 1. Apilar los datasets diarios de las estaciones
datos_diarios_unificados <- rbind(estacion_472, estacion_910)

# 2. Combinar con los metadatos
# - full_join(): Conserva absolutamente todo (ninguna estación se pierde).
# - inner_join(): Filtra estrictamente y se queda solo con las estaciones que coinciden en ambas tablas.

# Opción A: Unión completa (Recomendada para no perder registros)
datos_completos <- datos_diarios_unificados |> 
  full_join(metadatos, by = "id")

# Opción B: Unión interna (Ideal si querés trabajar con un volumen menor y filtrar datos huérfanos)
datos_filtrados <- datos_diarios_unificados |> 
  inner_join(metadatos, by = "id")
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

### Cómo contribuir

Si querés colaborar con el proyecto, leé la [guía de
contribución](https://github.com/ManuelaBulgubure/queRemosapRobar/blob/master/.github/CONTRIBUTING.md),
donde explicamos cómo proponer cambios mediante ramas y *pull requests*.

Este proyecto se rige por un [código de
conducta](https://github.com/ManuelaBulgubure/queRemosapRobar/blob/master/CODE_OF_CONDUCT.md).
Al participar (en *issues*, *pull requests* o chats de trabajo) te pedimos
respetarlo.
