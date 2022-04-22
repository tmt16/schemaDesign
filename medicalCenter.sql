DROP DATABASE IF EXISTS medicalCenter;
CREATE DATABASE medicalcenter_db;
\c medicalcenter_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    disease_id INTEGER NOT NULL REFERENCES diseases ON DELETE CASCADE,
    visit_id INTEGER NOT NULL REFERENCES visits ON DELETE CASCADE
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE
);

-- INSERT INTO doctors (first_name, last_name)
-- VALUES ('Adam', 'Smith'),
-- ('John', 'Galvan');

-- INSERT INTO patients (first_name, last_name, birth_date)
-- VALUES ('John', 'Javior', '1984-10-21'),
-- ('Jim ', 'Ochoa', '1993-03-05');

-- INSERT INTO diseases (disease_name) 
-- VALUES ('Heart Disease'), ('Diabetes'), ('Cancer');