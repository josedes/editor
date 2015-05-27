class AddCamposToMenu2s < ActiveRecord::Migration
  def change
    add_column :menu2s, :titulo_contenido, :string
    add_column :menu2s, :contenido, :text
  end
end
