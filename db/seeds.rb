# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Borrar contenido de las tablas Usuarios y todas las de niveles"

puts "Borrando usuarios"
Usuario.delete_all

puts "Borrando enlaces de nivel 0"
Menu0.delete_all

puts "Crear el usuario de prueba"

u = Usuario.new(
#  :username => "#{title} #{name} #{surname}",
#  :email => "#{name}.#{surname}_#{num}@localtinkers.com",
#  :password => '12341234'

  username: "root",
  nombre: "Usuario root",
  apellido: "",
  email: "root@gmail.com",
  password: '12345678',
  rol: 0

)
u.save!(validate: false)

puts "Creación de las opciones del Menú principal"

#titulos_vinculos = [
#  "Qué es la Alergia?",
#  "Tipos de Alergia",
#  "Embarazos y Alergia",
#  "Alergia y Medicamentos",
#  "Asma", 
#  "Cirugía y Alergia", 
#  "Contacto"
#]

titulos_vinculos = {
  :alergia => "Qué es la Alergiassssss?",
  :tipos => "Tipos de Alergia",
  :embarazos => "Embarazos y alergia",
  :asma => "Asma",
  :medicamentos => "Alergia y medicamentos",
  :cirugia => "Cirugía y Alergia",
  :contacto => "Contacto"

}

#Generar los registros para cada enlace del menu principal en la BD
titulos_vinculos.each do |enlace, titulo|
 Menu0.create( titulo: titulo, enlace: enlace)
end