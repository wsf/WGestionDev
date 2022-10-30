ECHO OFF
REM Toma la fecha del sistema

set anio=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%

REM Crea dentro de SEGURIDAD la carpeta DOCUMENTOS_<FECHA>. Para un mayor orden, es recomendable concatenarlo primero
REM por Año, Mes y Día para que al realizar revisiones a la carpeta SEGURIDAD, se vean en orden.
REM SEGURIDAD/DOCUMENTOS_AAAAMMDD

MD Seguridad_%anio%%mes%%dia%

REM Proceso de copiado

XCOPY *.* /s/e/f Seguridad_%anio%%mes%%dia%\