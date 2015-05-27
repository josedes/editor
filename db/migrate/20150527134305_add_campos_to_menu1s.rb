class AddCamposToMenu1s < ActiveRecord::Migration
  def change
    add_column :menu1s, :titulo_contenido, :string
    add_column :menu1s, :contenido, :text
  end
end
