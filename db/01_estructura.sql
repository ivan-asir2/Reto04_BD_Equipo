CREATE DATABASE IF NOT EXISTS proyecto_udit CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS proyecto_udit.contenidos (
  id_contenido     VARCHAR(20)  PRIMARY KEY,
  titulo           VARCHAR(100) NOT NULL,
  tipo             VARCHAR(10)  NOT NULL,
  ruta_repositorio VARCHAR(255) NOT NULL,
  fecha_alta       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_tipo CHECK (tipo IN ('VIDEO','COMIC','IMAGEN','JUEGO'))
);

INSERT INTO proyecto_udit.contenidos (id_contenido, titulo, tipo, ruta_repositorio) VALUES
('vid-0001', 'Video de ejemplo',  'VIDEO',  'videos/vid-0001/'),
('com-0001', 'Comic de ejemplo',  'COMIC',  'comics/com-0001/'),
('img-0001', 'Imagen de ejemplo', 'IMAGEN', 'imagenes/img-0001.png');

SHOW TABLES FROM proyecto_udit;