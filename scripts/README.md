## Scripts/
Contenedor para los archivos script de SQL así como python

### SliceCsvs
Este script busca el archivo indicado en el arrelgo de nombres de archivos para posteriormente crear una carpeta y empezar a almacernar las salidas en dicha carpeta.

Lee todo el archivo original en modo lectura con un buffer grande de 8kb (8192b) para no estar accediendo muchas veces al archivo haciendolo costoso en tiempo y procesamiento.

Crea una carpeta con el nombre del archivo original y concatena la palabra salidas para indicar que son las salidas del mismo.

Para cada linea del archivo leido verifica si el módulo de la división del número total de líneas entre 50 y la línea actual es igual a 0 para saber si debe crear otro archivo. 

Así pues va concatenando cada línea (resgistro) al nombre del archivo actual hasta que sean de 5525 cada uno debido al numero de archivos deseadas y longitud del archivo original porporcionado.

### LoadData

Por otro lado, el script SQL es usado para crear desde la base de datos asi como sus tabla para, por ultimo insertar registros a todas las tablas creadas a partir de archivos csv indicando que salte el titulo de las columnas asi como el separador de cada valor de cada tabla.

Al cargar 25 archivos por tabla se uso un temporizador de 18 segundos dando un total de 15 minutos para hacer la insercion de todos los valores y no ser tan demandante con el hardware del servidor.