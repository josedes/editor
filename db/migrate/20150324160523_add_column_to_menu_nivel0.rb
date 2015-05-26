class AddColumnToMenuNivel0 < ActiveRecord::Migration
  def change
    add_column :menu_nivel0s, :enlace, :string
  end
end
