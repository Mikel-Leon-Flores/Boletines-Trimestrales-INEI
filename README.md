# Boletines-Trimestrales-INEI
Repositorio que replica los boletines trimestrales del Instituto Nacional de Estadística e Informática (INEI) en Stata. Elaborado con un código único para que pueda ser replicado independientemente del periodo sobre el cuál se esté trabajando.

Los **Boletines Trimestrales del INEI** son la forma principal que tiene esta institución de comunicar información estadística sobre el país al público. Sin embargo, realizar análisis estadístico requiere recrear la codificación de las variables utilizadas por el INEI (por ejemplo, para realizar regresiones). El objetivo de este repositorio es facilitar la replicación de estos boletines, y generar variables tales que estas sean equivalentes a lo reportado por INEI.

> Este proyecto es mantenido de forma independiente y sin ninguna relación a INEI por parte del autor

Elaborado por <a href="https://github.com/Mikel-Leon-Flores">Mikel Leon Flores</a>, Estudiante de Economía en la Universidad Nacional Mayor de San Marcos.

## Indicaciones

### 1. Código
El código está disponible en Stata. Futuras versiones en Python, RStudio, y Julia están en desarrollo

### 2. Boletines
La estructura de los <a href="https://m.inei.gob.pe/biblioteca-virtual/boletines/">Boletines del INEI</a> está dada de la siguiente forma:
- **Empleo a Nivel Nacional**: Información trimestral y de año móvil. A partir de 2023 (Trimestre 1, 2023) la información se obtiene de la Encuesta Permanente de Empleo Nacional (EPEN), previo a esto la información se obtenía de la Encuesta Nacional de Hogares (ENAHO).
