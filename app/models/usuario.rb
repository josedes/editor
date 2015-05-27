class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :username, presence: true, uniqueness: true,
   length: {in: 5..20, 
            too_short: "Debe tener al menos 5 caracteres", 
            too_long: "debe tener máximo 20 caracteres"},
    format: {with: /([A-Za-z0-9\-\_]+)/, message: "Solo puedes colocar letras, números y guiones"}
validates :nombre, presence: true
validates :apellido, presence: false

end
