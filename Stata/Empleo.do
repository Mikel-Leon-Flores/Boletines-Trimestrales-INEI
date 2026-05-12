********************************************************************************
************************** Boletines de empleo - INEI **************************
********************************************************************************

* Tipo de Proyecto: Nulo
* Autor: Mikel A. Leon Flores

* Se busca replicar los resultados de los boletines trimestrales del INEI respecto a empleo, tanto por la parte de los gráficos presentados como las tablas estadísticas.

********************************************************************************
********************************************************************************
********************************************************************************

* Ruta base
global root "C:\Users\mikel\Downloads"

* Anual 2025
use "$root\EPEN 2025 BD_Publicacion Dpto.dta", clear

******************
* Limpieza Inicial
******************
rename *, lower

rename area urbano
rename c207 sexo
rename c208 edad

gen pea = 1 if ocup300 == 1 | ocup300 == 2
replace pea = 0 if ocup300 == 3 | ocup300 == 4

replace urbano = 0 if urbano == 2

gen gr_et = 1 if edad >= 14 & edad <=24
replace gr_et = 2 if edad > 24 & edad <= 44
replace gr_et = 3 if edad > 44 & !missing(edad)

gen tam_em = 1 if c317a >= 1 & c317a <= 10
replace tam_em = 2 if c317a > 10 & c317a <= 50
replace tam_em = 3 if c317a > 50 & !missing(c317a)

gen ciiu1 = c309_cod / 1000
replace ciiu1 = trunc(ciiu1)

gen ciiu2 = c309_cod / 100
replace ciiu2 = trunc(ciiu2)

gen ciiu3 = c309_cod / 10
replace ciiu3 = trunc(ciiu3)

gen rama = 1 if ciiu2 >= 1 & ciiu2 <= 9
replace rama = 2 if ciiu2 >= 10 & ciiu2 <= 33
replace rama = 3 if ciiu2 >= 41 & ciiu2 <= 43
replace rama = 4 if ciiu2 >= 45 & ciiu2 <= 47
replace rama = 5 if missing(rama)

********
* Labels
********

label define RAMA 1 "Agricultura/Pesca/Minería" 2 "Manufactura" 3 "Construcción" 4 "Comercio" 5 "Servicios"

label values rama RAMA

***************************************
* Tabs correspondientes a los boletines
***************************************

* 1.1 Indicadores del Mercado Laboral a Nivel Nacional *

* Cuadro N° 1.1A
* PET, según condición de actividad y área de residencia
tab pea [iw = fac300_anual]
tab pea if urbano == 1 [iw = fac300_anual]
tab pea if urbano == 0 [iw = fac300_anual]

* 1.2 Características de la Población Económicamente Activa *

* Cuadro N° 1.2A
* PEA, según sexo y grupo de edad
tab sexo pea if pea == 1 [iw = fac300_anual]
tab gr_et pea if pea == 1 [iw = fac300_anual]

* Cuadro N° 1.3A
* Tasa de actividad, según área de residencia
tab urbano pea [iw = fac300_anual], row

* Cuadro N° 1.4A
* Tasa de actividad, según sexo y grupo de edad
tab sexo pea [iw = fac300_anual], row
tab gr_et pea [iw = fac300_anual], row

* 1.3 Características de la Población Económicamente no Activa*

* Cuadro N° 1.5A
* No PEA, según sexo y grupo de edad
tab sexo pea [iw = fac300_anual]
tab gr_et pea [iw = fac300_anual]

* Cuadro N° 1.6A
* No PEA, según composición
tab c353 [iw = fac300_anual] if pea == 0

* 1.4 Población Ocupada*

* Cuadro N° 1.7A
* Población Ocupada, según área de residencia
tab urbano if ocup300 == 1 [iw = fac300_anual] 

* Cuadro N° 1.8A
* Población Ocupada, según sexo y grupo de edad
tab sexo if ocup300 == 1 [iw=fac300_anual]
tab gr_et if ocup300 == 1 [iw=fac300_anual]

* Cuadro N° 1.9A
* Población Ocupada, según tamaño de empresa
tab tam_em if ocup300 == 1 [iw=fac300_anual]

* Cuadro N° 1.10A
* Población Ocupada, según rama de actividad
tab rama if ocup300 == 1 [iw=fac300_anual]
