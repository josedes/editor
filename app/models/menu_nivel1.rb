class MenuNivel1 < ActiveRecord::Base
  belongs_to :MenuNivel0
  belongs_to :contenido
end
