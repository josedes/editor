class AddColumnToMenuNivel2 < ActiveRecord::Migration
  def change
    add_column :menu_nivel2s, :enlace, :string
  end
end
