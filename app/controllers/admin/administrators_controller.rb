class Admin::AdministratorsController < ApplicationController
  layout "admin"
  
  def index
  	 flash[:notice] = "Bienvenido #{current_usuario.nombre} a la zona privada"
  
  end

  def cms
  	
  end

  def alervac
  end
end
