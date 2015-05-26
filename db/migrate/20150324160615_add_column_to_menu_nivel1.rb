class AddColumnToMenuNivel1 < ActiveRecord::Migration
  def change
    add_column :menu_nivel1s, :enlace, :string
  end
end
