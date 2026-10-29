# Pautas para Colaborar 🌤️

¡Gracias por querer colaborar con nosotras en el desarrollo de nuestro
paquete meteorológico! Queremos que este proceso sea enriquecedor, claro
y prolijo.

------------------------------------------------------------------------

### 1. Reglas básicas antes de mandar código

Para mantener el paquete ordenado y sin romper nada, asegurate de:

- **Estilo:** Intentá mantener el código prolijo y legible (usamos las
  buenas prácticas de *tidyverse*).
- **Documentación:** Si agregás o modificás una función,
  sumale/actualizale las líneas de `roxygen2` arriba con sus parámetros
  y ejemplos.
- **Imports explícitos:** Usá siempre `paquete::funcion()` (por ejemplo,
  [`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
  o
  [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html))
  adentro de las funciones.

------------------------------------------------------------------------

### 2. Paso a paso para subir tus cambios

1.  **Creá una rama (*branch*):** No pushees directo a `main`. Arma una
    rama con un nombre descriptivo:

    ``` bash
    git checkout -b feature/nueva-grafica
    ```

2.  **Verificá que todo funcione:** Asegurate de que la documentación
    esté actualizada y el paquete no tire errores corriendo los comandos
    de verificación en tu consola.

3.  **Mandá un Pull Request (PR):** Pushea tu rama a GitHub, abrí un
    Pull Request explicando brevemente los cambios y avisale al equipo
    para lo revisemos.

------------------------------------------------------------------------

### 3. Código de Conducta

Por favor, recordá que este proyecto se rige bajo nuestro [Código de
Conducta](https://manuelabulgubure.github.io/queRemosapRobar/CODE_OF_CONDUCT.md).
Te pedimos leerlo antes de empezar a colaborar para mantener un espacio
de trabajo respetuoso y agradable para todos.
