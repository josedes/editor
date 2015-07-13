class Prueba

def filaParaAlmacenar(ex, fila)

expresion3 = /SUSPENDIO|SUSPENDIDO|NUNCA|NO RETIRO/
  columna = 10
  log = true
  for columna in (10 ..17)
  	dato = ex.cell(fila,columna)
  	if !dato.instance_of? Date	
    	if expresion3.match(dato)
    		log = false;
    		break
    fechaElaboracion = ex.cell(fila,columna)
    fechaRetiro = ex.cell(fila,columna + 1)    

    if !fechaElaboracion.instance_of? Date
      if expresion1.match(fechaElaboracion)
        log = false
        columna = 18
      end
      if expresion2.match(fechaElaboracion)
        log = false 
      end
    end
    
    if estado == ""
      if !fechaRetiro.instance_of? Date
        if fechaRetiro.nil? or fechaRetiro.strip == "" or expresion2.match(fechaRetiro)       
          fechaRetiro = nil
          log = false
          columna = 18
        else
          if expresion1.match(fechaRetiro)
            estado2 = false
            columna = 18
          end
        end
      end
    end

    columna = columna + 2
  end

    if !expresion3.match(estado) and !expresion3.match(estado2) 
     false
    else
      true
    end  
end 
end