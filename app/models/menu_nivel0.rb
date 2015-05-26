class MenuNivel0 < ActiveRecord::Base
  belongs_to :contenido
  belongs_to :usuario

   after_save :reload_routes

  def reload_routes
    DynamicRouter.reload
  end
  
end
