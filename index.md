# queRemosaprobar

El objetivo principal del paquete `queRemosaprobar` es proporcionar un
conjunto robusto y estructurado de herramientas en R para la lectura, el
procesamiento, el análisis estadístico y la visualización de datos
meteorológicos provenientes de diversas estaciones de medición.

Este paquete fue desarrollado con fines académicos en el marco de la
asignatura Programación II, aplicando buenas prácticas de desarrollo de
software en R (documentación con Roxygen2, viñetas y control de
versiones con Git/GitHub).

------------------------------------------------------------------------

## Instalación

Podés instalar la versión en desarrollo de `queRemosaprobar`
directamente desde GitHub ejecutando las siguientes líneas en tu consola
de R:

Con el paquete `pak`:

``` R
install.packages("pak")
pak::pak("ManuelaBulgubure/queRemosaprobar")
```

O utilizando `devtools`:

``` R
install.packages("devtools")
devtools::install_github("ManuelaBulgubure/queRemosaprobar")
```

------------------------------------------------------------------------

## Flujo de Trabajo y Funciones Principales

El paquete cuenta con un flujo de trabajo integrado diseñado para
acompañarte desde la importación inicial de los datos climáticos hasta
la generación de gráficos analíticos detallados.

Para comenzar a utilizar las funciones, primero cargamos la librería:

``` R
library(queRemosaprobar)
```

### 1. Lectura e Importación de Datos (`lectura_datos`)

La función
[`lectura_datos()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/lectura_datos.md)
permite descargar e importar de forma automatizada un archivo CSV con
mediciones climáticas a partir del identificador de la estación. Si el
archivo ya se encuentra disponible en tu entorno local, lo lee
directamente desde el disco:

``` R
# Ejemplo de importación para la estación "nh0437"
datos_clima <- lectura_datos(id = "nh0437", ruta = "nh0437.csv")

# Inspección preliminar de los datos cargados
head(datos_clima)
```

### 2. Resumen Estadístico de Temperatura (`tabla_resumen_temperatura`)

Utilizando la función
[`tabla_resumen_temperatura()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/tabla_resumen_temperatura.md),
es posible obtener una tabla estructurada y agrupada por estación (`id`)
que calcula automáticamente la temperatura promedio, mínima y máxima a
150 cm de altura:

``` R
# Cálculo de la tabla resumen estadística
resumen_temp <- tabla_resumen_temperatura(datos_clima)

# Mostrar el resultado en consola
resumen_temp
```

### 3. Visualización de la Evolución Mensual (`grafico_temperatura_mensual`)

Para analizar el comportamiento temporal y las tendencias de la
temperatura a lo largo del año, utilizamos
[`grafico_temperatura_mensual()`](https://manuelabulgubure.github.io/queRemosapRobar/reference/grafico_temperatura_mensual.md).
Esta función genera una visualización gráfica clara y estéticamente
cuidada construida sobre `ggplot2`:

``` R
# Generación del gráfico mensual para la estación
grafico_temperatura_mensual(data_frame = datos_clima, titulo = "Evolución Mensual de Temperatura - Estación NH0437")
```

------------------------------------------------------------------------

## Viñeta de Introducción

Si querés profundizar en los conceptos, ver más ejemplos prácticos y
entender en detalle la arquitectura del paquete, podés consultar la
viñeta interactiva integrada ejecutando el siguiente comando en tu
consola de R:

``` R
vignette("vineta_queRemosaprobar", package = "queRemosaprobar")
```

------------------------------------------------------------------------

## Autores y Contribuciones

Este proyecto fue desarrollado de forma colaborativa por estudiantes de
la cátedra de Programación II:

- **Manuela Bulgubure**
- **Paulina Guerscovich**

------------------------------------------------------------------------
