require 'date'

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






#COMIENZO PACIENTES

#se eliminan todos los datos que pueden estar en la tabla usuarios

#guardo los datos del excel en un arreglo llamado celdas
       $celdas=[] 
       ex = Roo::Excel.new("#{Rails.root}/db/pacientes-de-Inmunoterapia.xls")

       ex.default_sheet = ex.sheets.first
       posC=0
       puts "MIGRACION DATOS DE USUARIOS DEL ARCHIVO DE EXCEL A LA TABLA USUARIOS"
       #puts ex.last_row
      #fechaActual = Time.new.to_a
      fechaActual = DateTime.now
      puts fechaActual << 10
      #puts fechaActual
      #puts fechaActual.to_a
      pos=''
       for fila in (4 .. ex.last_row)
       #for fila in (4 .. 8)
            puts "FILA = #{fila}"
            usuario = {
              :numeroExcel => ex.cell(fila,1).to_s.sub(".0",""),
              :apellido => ex.cell(fila,2).strip,
              :nombre => ex.cell(fila,3).strip,
              :historia => ex.cell(fila,4).to_s.sub(".0",""),
              :fechaNacimiento => ex.cell(fila,5).to_s.sub(".0",""),
              :telefonoHabitacion => ex.cell(fila,6).to_s.sub(".0",""),
              :telefonoTrabajo => ex.cell(fila,7).to_s.sub(".0",""),                
              :celular1 => nil,
              :celular2 => nil,
              :email => ex.cell(fila,8),
              :email2 => ex.cell(fila,9),
              #se esta colocando como username y password:
              #historia-numero
              #por ejemplo para el usuario 
              :username => ex.cell(fila,4).to_s.sub(".0","") + "-" + ex.cell(fila,1).to_s.sub(".0",""),
              :password => ex.cell(fila,4).to_s.sub(".0","") + "-" + ex.cell(fila,1).to_s.sub(".0","")
            }
            if usuario[:telefonoHabitacion].strip.length ==0
                  usuario[:telefonoHabitacion] = nil
            end      
            if usuario[:telefonoTrabajo].strip.length ==0
                  usuario[:telefonoTrabajo] = nil
            end 
 
            if !usuario[:email].nil? 
              if usuario[:email].strip.length == 0
                 usuario[:email] = usuario[:apellido]+"-"+usuario[:numeroExcel]+"@cambiarcorreo.com"   
              end
            else
              usuario[:email] = usuario[:apellido].gsub(" ", "-")+"-"+usuario[:numeroExcel]+"@cambiarcorreo.com"   
            end      

            expresion = /(0416|0412|0414|0424)-\d{7}/
            m = expresion.match(usuario[:telefono1])

            if expresion.match(usuario[:telefonoHabitacion]) 
                usuario[:celular1] = usuario[:telefonoHabitacion]
                usuario[:telefonoHabitacion] = nil
                if expresion.match(usuario[:telefonoTrabajo])                
                  usuario[:celular2] = usuario[:telefonoTrabajo]
                  usuario[:telefonoTrabajo] = nil 
                end
            else
                if expresion.match(usuario[:telefonoTrabajo])                
                  usuario[:celular1] = usuario[:telefonoTrabajo]
                  usuario[:telefonoTrabajo] = nil 
                end
            end
                      
            puts usuario                      
            u = Usuario.new(numeroExcel: usuario[:numeroExcel].to_i,
                           nombre: usuario[:nombre], 
                           apellido: usuario[:apellido],
                           historia: usuario[:historia],
                           telefonoHabitacion: usuario[:telefonoHabitacion],
                           telefonoTrabajo: usuario[:telefonoTrabajo],
                           celular1: usuario[:celular1],
                           celular2: usuario[:celular2],
                           email: usuario[:email],
                           email2: usuario[:email2],
                           username: usuario[:username],
                           password: usuario[:password],
                           rol: 2  
                        )
            u.save(validate: false)

            puts "EL ID ES #{u.id}" 
        end 




#COMIENZO FRASCOS
$celdas=[] 
ex = Roo::Excel.new("#{Rails.root}/db/pacientes-de-Inmunoterapia.xls")
expresion1 = /SUSPENDIO|SUSPENDIDO/
expresion2 = /NUNCA/
expresion3 = /SUSPENDIO|SUSPENDIDO|NUNCA|NO RETIRO/

puts "BORRANDO FRASCOS EXISTENTES"
Frasco.delete_all
contador = 0

puts "INICIO PROCESAMIENTO EXCEL FRASCOS"
for fila in (4 .. ex.last_row)
#for fila in (4 .. 10)
  puts ""
  puts "ANALIZANDO USUARIO = #{ex.cell(fila,1).to_s.sub(".0",""))}"
  log = true
  numeroFrasco = 1
  infoFrasco = ""
  columna = 10
  arrregloFrascosxUsuario = []
  u = Usuario.where(:numeroExcel => ex.cell(fila,1).to_s.sub(".0",""))
  #puts "ID DEL USUARIO ES #{u[0].id}"
  #puts "CANTIDAD DE USUARIOS = #{u.size}"   
  while (columna <=80)
    #infoFrasco tendra en un ciclo toda la información del frasco
    
    #se obtiene el dato de la columna 1 del frasco
    dato1 = ex.cell(fila,columna)
    dato2 = ex.cell(fila,columna+1)
   # if dato1.to_s != ''      
   #  puts "valor de dato1 =#{dato1}SI"
   # end

    if dato1.to_s == '' && dato2.to_s ==''

    else  
        if dato1.to_s != ''
          infoFrasco = numeroFrasco.to_s + '#' + 'COMPOSICION' + '#'
          if !dato1.instance_of? Date
            if expresion1.match(dato1)
              infoFrasco = infoFrasco + "SUSPENDIO" + "#"
            else
              if expresion3.match(dato1)
                infoFrasco = infoFrasco + "NO RETIRO" + "#"
              end
            end  
          else
             infoFrasco = infoFrasco + dato1.to_s + "#"
          end

          #se obtiene el dato de la columna 2 del frasco
          if dato2.to_s != '' 
            if !dato2.instance_of? Date
              if expresion1.match(dato2)
                infoFrasco = infoFrasco + "SUSPENDIO" + "#"
              else
                if expresion3.match(dato2)
                  infoFrasco = infoFrasco + "NO RETIRO" +"#"
                end
              end  
            else
               infoFrasco = infoFrasco + dato2.to_s + "#"
            end
          end

        end  
        if infoFrasco
          #puts infoFrasco
          arrregloFrascosxUsuario << infoFrasco  
          #puts "SIG"
        end

    end    
    columna = columna + 2
    numeroFrasco= numeroFrasco + 1
    contador = contador + 1

  end  
 
  puts arrregloFrascosxUsuario.length
  for i in arrregloFrascosxUsuario.length+1..40
    arrregloFrascosxUsuario << ""
  end

  #puts arrregloFrascosxUsuario
  #puts ""

  frasco = Frasco.new(frasco1: arrregloFrascosxUsuario[0],
                    frasco2: arrregloFrascosxUsuario[1],
                    frasco3: arrregloFrascosxUsuario[2],
                    frasco4: arrregloFrascosxUsuario[3],
                    frasco5: arrregloFrascosxUsuario[4],
                    frasco6: arrregloFrascosxUsuario[5],
                    frasco7: arrregloFrascosxUsuario[6],
                    frasco8: arrregloFrascosxUsuario[7],
                    frasco9: arrregloFrascosxUsuario[8],
                    frasco10: arrregloFrascosxUsuario[9],
                    frasco11: arrregloFrascosxUsuario[10],
                    frasco12: arrregloFrascosxUsuario[11],
                    frasco13: arrregloFrascosxUsuario[12],
                    frasco14: arrregloFrascosxUsuario[13],
                    frasco15: arrregloFrascosxUsuario[14],
                    frasco16: arrregloFrascosxUsuario[15],
                    frasco17: arrregloFrascosxUsuario[16],
                    frasco18: arrregloFrascosxUsuario[17],
                    frasco19: arrregloFrascosxUsuario[18],
                    frasco20: arrregloFrascosxUsuario[19],
                    frasco21: arrregloFrascosxUsuario[20],
                    frasco22: arrregloFrascosxUsuario[21],
                    frasco23: arrregloFrascosxUsuario[22],
                    frasco24: arrregloFrascosxUsuario[23],
                    frasco25: arrregloFrascosxUsuario[24],
                    frasco26: arrregloFrascosxUsuario[25],
                    frasco27: arrregloFrascosxUsuario[26],
                    frasco28: arrregloFrascosxUsuario[27],
                    frasco29: arrregloFrascosxUsuario[28],
                    frasco30: arrregloFrascosxUsuario[29],
                    frasco31: arrregloFrascosxUsuario[30],
                    frasco32: arrregloFrascosxUsuario[31],
                    frasco33: arrregloFrascosxUsuario[32],
                    frasco34: arrregloFrascosxUsuario[33],
                    frasco35: arrregloFrascosxUsuario[34],
                    frasco36: arrregloFrascosxUsuario[35],
                    frasco37: arrregloFrascosxUsuario[36],
                    frasco38: arrregloFrascosxUsuario[37],
                    frasco39: arrregloFrascosxUsuario[38],
                    frasco40: arrregloFrascosxUsuario[39],
                    usuario_id: u[0].id  
                    )

    #frasco.save(validate: false)

     # arrregloFrascosxUsuario.each do |elemento|
     #   puts "FRASCO #{numeroFrasco} = #{elemento}"
     #   frasco.frasco1 = elemento
     #   numeroFrasco = numeroFrasco + 1
     #end
#end      


end
puts "NÚMERO TOTAL DE FRASCOS = "+ contador.to_s        