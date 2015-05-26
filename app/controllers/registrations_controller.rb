# Devise:: le estamos indicando que herede de devise.
#no se va a escribir el código del controlador de devise sino que vamos a modificar #solamente lo que el padre (devise) haría.
#luego es nesario que el router se modifique para que utilice el nuevo controlador

class RegistrationsController < Devise::RegistrationsController

def new
	super
end

def create
	super
end

def update
	super
end


private

def sign_up_params
	allow = [:email, :username, :nombre, :apellido, :password, :password_confirmation]
	params.require(resource_name).permit(allow)
end
end