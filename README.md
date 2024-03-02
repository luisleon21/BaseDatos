# BaseDatos
PhysioLink


registro medico bajo variables de salud dictadas por el medico encargado bajo parametros establecidos por el medico

frecuencia cardiaca

doctor
- admin registra doctor
- habilita quien puede usar app
- autoriza rangos
- selector de variable a medir -> 
- estable tiempo (seleccionable o fijo)
- registro preliminar

paciente
- registro completo
- ver datos, ver rangos, en grafica, tabla, valor
- aviso de alertas


#DbDiagram.io

table tipo_documento{
  id serial pk
  documento varchar(250)
  sigla varchar(5)
}

table paciente{
  id serial pk
  doctor integer [ref: > doctor.id]  
  eps integer [ref: > eps.id]
  tipo_documento integer [ref: > tipo_documento.id]
  numero_documento integer
  nombres varchar(250)
  apellidos varchar(250)
  fecha_nacimiento date
  edad integer
  
}

table usuario{
  id serial pk
  usuario integer [ref: > paciente.id]
  password varchar(250)  
}

table doctor{
  id serial pk
  nombres varchar(250)
  apellidos varchar(250)
  licencia varchar(250)
  correo varchar(250)
}

table signos{
  id serial pk
  paciente integer [ref: > paciente.id]
  temperatura float
  spo2 float
  ritmo_cardiaco float
}

table alertas{
  id serial pk
  paciente integer [ref: > paciente.id]
  doctor integer [ref: > doctor.id]  
  
}

table eps{
  id serial pk
  nombre varchar(250)
}
