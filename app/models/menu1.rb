class Menu1 < ActiveRecord::Base
  belongs_to :contenido
  belongs_to :menu0
  has_many :menu2
end
