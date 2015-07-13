
require 'date'

"require './prueba.rb'"

$celdas=[] 
ex = Roo::Excel.new("#{Rails.root}/db/pacientes-de-Inmunoterapia.xls")
expresion1 = /SUSPENDIO|SUSPENDIDO/
expresion2 = /NUNCA/
expresion3 = /SUSPENDIO|SUSPENDIDO|NUNCA|NO RETIRO/

puts "BORRANDO FRASCOS EXISTENTES"
Frasco.delete_all
contador = 0

puts "INICIO PROCESAMIENTO DE ARCHIVO EXCEL FRASCOS"
for fila in (4 .. ex.last_row)
#for fila in (4 .. 10)

  puts "ANALIZANDO USUARIO = #{ex.cell(fila,1).to_s.sub(".0","")}"
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
          arrregloFrascosxUsuario << infoFrasco  
        end

    end    
    columna = columna + 2
    numeroFrasco= numeroFrasco + 1
    contador = contador + 1

  end  
 
  for i in arrregloFrascosxUsuario.length+1..40
    arrregloFrascosxUsuario << ""
  end

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

    frasco.save(validate: false)

     # arrregloFrascosxUsuario.each do |elemento|
     #   puts "FRASCO #{numeroFrasco} = #{elemento}"
     #   frasco.frasco1 = elemento
     #   numeroFrasco = numeroFrasco + 1
     #end
#end      


end
puts "NÚMERO TOTAL DE FRASCOS = "+ contador.to_s


 