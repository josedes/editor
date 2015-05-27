class AddCamposToMenu0s < ActiveRecord::Migration
  def change
    add_column :menu0s, :titulo_contenido, :string
    add_column :menu0s, :contenido, :text
  end
end
