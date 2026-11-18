# Reto 4 · Base de datos del equipo (Sprint 1)

Reto individual de ASGBD del Proyecto Integrado. Consiste en instalar y preparar MySQL 8.4, crear la base de datos inicial del proyecto y una cuenta administradora limitada a esa base de datos.

## Contenido del repositorio

```text
Reto04_BD_Equipo/
├── README.md
├── .gitignore
├── db/
│   ├── 01_estructura.sql
│   ├── 02_usuario_admin.sql
│   └── 03_pruebas_admin.sql
├── docs/
│   ├── acuerdo_integracion_sprint1.md
│   └── parte_f_justificacion.md
└── capturas/
```

## Descripción de los archivos

| Archivo | Descripción |
|---|---|
| `db/01_estructura.sql` | Crea la base de datos `proyecto_udit`, la tabla provisional `contenidos` y datos ficticios de prueba. |
| `db/02_usuario_admin.sql` | Crea la cuenta `admin_equipo` con permisos solo sobre `proyecto_udit.*`, sin `WITH GRANT OPTION`. Contiene marcadores en lugar de la contraseña real. |
| `db/03_pruebas_admin.sql` | Pruebas de conexión y de permisos permitidos y denegados. |
| `docs/acuerdo_integracion_sprint1.md` | Acuerdos y puntos pendientes con DAM sobre identificadores, tipos de contenido, nombres de campos y rutas. |
| `docs/parte_f_justificacion.md` | Justificaciones técnicas de la Parte F. |
| `capturas/` | Evidencias propias de las pruebas realizadas. |

## Seguridad

- No se suben contraseñas ni IPs reales. Los scripts usan marcadores del tipo `[SUSTITUIR_...]`.
- La copia local `02_usuario_admin.local.sql` (con la contraseña real) está excluida mediante `.gitignore` (`*.local.sql`).
- `admin_equipo` solo administra `proyecto_udit`; no tiene privilegios globales.

## Cómo usar los scripts

1. Conectarse con `admin_udit` desde DBeaver.
2. Ejecutar `db/01_estructura.sql`.
3. Hacer una copia local de `db/02_usuario_admin.sql` como `02_usuario_admin.local.sql`, sustituir los marcadores por los valores reales y ejecutarla.
4. Conectarse con `admin_equipo` y ejecutar las pruebas de `db/03_pruebas_admin.sql` una a una.

## Estado

La tabla `contenidos` es provisional. El formato definitivo del identificador, los campos y las rutas se acordará con DAM (ver `docs/acuerdo_integracion_sprint1.md`).