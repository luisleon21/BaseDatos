CREATE TABLE tipo_documento (
  id serial PRIMARY KEY,
  documento varchar(250),
  sigla varchar(5)
);

CREATE TABLE paciente (
  id serial PRIMARY KEY,
  doctor integer,
  eps integer,
  tipo_documento integer,
  numero_documento integer,
  nombres varchar(250),
  apellidos varchar(250),
  fecha_nacimiento date,
  edad integer
);

CREATE TABLE usuario (
  id serial PRIMARY KEY,
  usuario integer,
  password varchar(250)
);

CREATE TABLE doctor (
  id serial PRIMARY KEY,
  nombres varchar(250),
  apellidos varchar(250),
  licencia varchar(250),
  correo varchar(250)
);

CREATE TABLE temperatura (
  id serial PRIMARY KEY,
  paciente integer,
  fecha datetime,
  valor float
);

CREATE TABLE spo2 (
  id serial PRIMARY KEY,
  paciente integer,
  fecha datetime,
  valor float
);

CREATE TABLE ritmo_cardiaco (
  id serial PRIMARY KEY,
  paciente integer,
  fecha datetime,
  valor float
);

CREATE TABLE mediciones_autorizadas (
  id serial PRIMARY KEY,
  paciente integer,
  temperatura bool,
  spo2 bool,
  ritmo_cardiaco bool
);

CREATE TABLE alertas (
  id serial PRIMARY KEY,
  paciente integer,
  doctor integer
);

CREATE TABLE eps (
  id serial PRIMARY KEY,
  nombre varchar(250)
);

ALTER TABLE paciente ADD FOREIGN KEY (doctor) REFERENCES doctor (id);

ALTER TABLE paciente ADD FOREIGN KEY (eps) REFERENCES eps (id);

ALTER TABLE paciente ADD FOREIGN KEY (tipo_documento) REFERENCES tipo_documento (id);

ALTER TABLE usuario ADD FOREIGN KEY (usuario) REFERENCES paciente (id);

ALTER TABLE temperatura ADD FOREIGN KEY (paciente) REFERENCES paciente (id);

ALTER TABLE spo2 ADD FOREIGN KEY (paciente) REFERENCES paciente (id);

ALTER TABLE ritmo_cardiaco ADD FOREIGN KEY (paciente) REFERENCES paciente (id);

ALTER TABLE mediciones_autorizadas ADD FOREIGN KEY (paciente) REFERENCES paciente (id);

ALTER TABLE alertas ADD FOREIGN KEY (paciente) REFERENCES paciente (id);

ALTER TABLE alertas ADD FOREIGN KEY (doctor) REFERENCES doctor (id);
