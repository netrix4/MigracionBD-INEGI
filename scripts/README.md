## Scripts/
Contenedor para los archivos script de sql así como python

Este scrip buscar el archivo indicado en el arrelgo de nombres de archivos para posteriormente crear una carpeta y empezar a almacernar las salidas en dicha carpeta.

Lee todo el arvhivo original en modo lectura con un buffer grande para no estar accediendo muchas veces al archivo haciendolo costo en tiempo y procesamiento

Crea una carpeta con el nombre del archivo original y concatena la palabra salidas para indicar que son las salidas del mismo.

para cada linea del archivo leido verifica si el modulo de la division del numero total de lineas entre 50 y la linea actual es igual a 0 para saber si debe crear otro archivo o no. 

Asi pues va concatenando cada linea al nombre del archivo actual hasta que sean de 5525 cada uno debido al numero de partes deseadas y longitud del archivo porporcionado. 