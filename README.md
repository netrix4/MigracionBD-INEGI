# MigraciónBD-INEGI

<!-- README que explique el metodo elegido para migrar los datos "los 138,123" al servidor
De haberse enfrentado a problemas deberan ser documentados y la solucion anexada -->

Este repositorio es una explicación de la aproximación a la solución para normalizar e importar a una instancia remota de MySQL una gran cantidad de datos.

Podemos encontrar carpetas para separar los tipos de archivos utilizados en esta solución.

### Scripts/
Contenedor para los archivos script de sql así como python
### Docs/
Archivos utilizador por los scripts para poder hacer las inserciones de toda la informacio a la instancia remota de MySQL.

# Inserción de Datos

La información constaba originalmente de 138124 registros con 42 columnas así que se en enfrentó un problema de recursos al encontrarse con un hardware limitado en la instancia remota.

Se optó por usar el formato de archivos de valores separador por coma (.csv) ya que es un formato casi universal muy parecido a los JSON para Objetos.
Dicho esto, se optó también por crear un archivo por cada tabla para poder a excepcion de establecimientos y direcciones que son las tablas mas grandes.

Adicionalmente, para estos ultimos dos se creó un script en python para poder dividirlo en 25 archivos con 5525 registros cada uno y así hacer menos demandante en recursos la inserción de el total de registros para ambas tablas. 

Con todos los archivos en el dirctorio, formato y tamaño correcto, ingresamos con nuestro usuario y contraseña a la instancia seguido por el argumento `--local-infile` para poder hacer uso de la sentencia SQL `LOCAL FILE DATA`.

El archivo `LoadData.sql` crea la base de datos `inegi_mario` así como todas las tablas con sus respectivas relaciones así como el resto de  propiedades y tipos de datos para posteriormente cargar los archivos `csv` correspondientes. Las primeras 6 tablas usa una sentencia por tabla ya que la mas grande de estas 6 tiene 42 registros, aceptable para los recursos de hardware limitado. En el caso de las ultimas 2 tablas como poseen la mayor cantidad de información y aunque se han dividido en 25 parte cada tabla, se utilizó un temporizador de 18 segundos entre cada una de estas partes así aligerando la demanda de recursos. 


# Problemas afrontados