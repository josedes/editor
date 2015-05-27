class Menu0 < ActiveRecord::Base
  belongs_to :contenido
  has_many :menu1s
end
