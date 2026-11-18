# Parte F · Justificación técnica

## a) Diferencia entre admin_udit y admin_equipo

`admin_udit` es la cuenta que administra todo el servidor MySQL: puede crear y borrar bases de datos, gestionar cuentas de usuario y consultar el esquema de sistema `mysql`. `admin_equipo`, en cambio, solo administra la base de datos del proyecto: tiene todos los privilegios sobre `proyecto_udit.*`, pero ninguno sobre el resto del servidor y sin `WITH GRANT OPTION`, así que tampoco puede dar permisos a otras cuentas.

Lo comprobé en las pruebas. Con `SHOW GRANTS` desde `admin_equipo` solo aparecen permisos sobre `proyecto_udit.*`, y al intentar consultar `mysql.user` me dio el error 1142 (acceso denegado), que es lo esperado.

Es mejor que el administrador del proyecto no tenga privilegios globales por el principio de mínimo privilegio. Si la cuenta se ve comprometida, o alguien se equivoca con ella, el daño queda limitado a `proyecto_udit` y no afecta a otras bases de datos, a las cuentas ni a la configuración del servidor.

## b) Por qué se guarda la ruta y no el fichero

Los vídeos, cómics e imágenes pesan mucho. Si se guardaran dentro de la tabla, la base de datos crecería muchísimo, las consultas serían más lentas y las copias de seguridad y restauraciones tardarían mucho más. Una base de datos está pensada para datos estructurados (identificador, título, tipo...) y no para almacenar archivos grandes.

Por eso la tabla `contenidos` guarda los datos descriptivos y una ruta relativa (`ruta_repositorio`) que indica dónde está el fichero. Así la tabla se mantiene ligera y rápida, y si un fichero cambia o se mueve solo hay que actualizar la ruta.

## c) Por qué acordar el identificador y la ruta con DAM

DAM desarrolla la aplicación que consultará esta base de datos y ASIR crea la base de datos. Ambos equipos deben usar el mismo formato de identificador (`id_contenido`), los mismos nombres de campo y el mismo patrón de rutas. Si no coinciden, la aplicación no encontrará los contenidos o fallará al cargarlos: por ejemplo, si DAM espera `vid-0001` y la base de datos guarda otro formato.

Si se cambia el identificador o la ruta cuando el modelo ya está cargado, habría que modificar la tabla, los datos y el código de la aplicación, con riesgo de romper referencias. Por eso conviene fijarlo antes de cerrar el Sprint 1. Los valores de mi reto son provisionales y el acuerdo real se registra en `docs/acuerdo_integracion_sprint1.md` (o queda como `PENDIENTE`).