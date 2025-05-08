-- Script SQL para la tabla de evaluaciones

CREATE TABLE IF NOT EXISTS evaluaciones (
    id SERIAL PRIMARY KEY,
    usuario VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    q1 INT,
    q2 INT,
    q3 INT,
    q4 INT,
    q5 INT,
    q6 INT,
    q7 INT,
    q8 INT,
    q9 INT,
    q10 INT,
    score INT,
    recomendacion TEXT
);

-- Ejemplo de inserción (la parte del backend se haría en tu lenguaje servidor, 
-- por ejemplo PHP, Node.js, Python, etc.)
INSERT INTO evaluaciones (usuario, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, score, recomendacion)
VALUES ('Estudiante1', 2, 2, 2, 2, 1, 1, 2, 2, 1, 2, 15, 'Recomendamos buscar ayuda profesional.');
