## Docs/
Archivos utilizador por los scripts para poder hacer las inserciones de toda la informacio a la instancia remota de MySQL.

Este script es usado para crear desde la base de datos asi como sus tabla para, por ultimo insertar registros a todas las tablas creadas a partir de archivos csv indicando que salte el titulo de las columnas asi como el separador de cada valor de cada tabla.

Al cargar 25 archivos por tabla se uso un temporizador de 18 segundos dando un total de 15 minutos para hacer la insercion de todos los valores y no ser tan demandante con el hardware del servidor.