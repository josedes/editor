class Menu2 < ActiveRecord::Base
  belongs_to :contenido
  belongs_to :menu1
end
