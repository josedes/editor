class DynamicRouter
def self.load
    EasyEditorDevise::Application.routes.draw do
      Nivel0.all.each do |pg|
        puts "Routing #{pg.enlace}"
        get "/#{pg.enlace}", :to => "pages_dynamic#show",  defaults: { id: pg.id }
      end
    end
  end

  def self.reload
    EasyEditorDevise::Application.routes_reloader.reload!
  end
end