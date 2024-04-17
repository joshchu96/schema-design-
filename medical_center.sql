DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center; 

\c medical_center 

--create a table for doctors
CREATE TABLE doctors ( 
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);

--patients 
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

--visit 
CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    FOREIGN KEY (patient_id) REFERENCES patient(id)
)

--list of diseases
CREATE TABLE diseases (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255)
);

--diagnosis 
CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY, 
    disease_id INT NOT NULL,
    visit_id INT NOT NULL,
    FOREIGN KEY(disease_id) REFERENCES diseases(id),
    FOREIGN KEY(visit_id) REFERENCES visit(id)
); 

