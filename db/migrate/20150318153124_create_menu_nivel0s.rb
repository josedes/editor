class CreateMenuNivel0s < ActiveRecord::Migration
  def change
    create_table :menu_nivel0s do |t|
      t.string :titulo
      t.string :estado
      t.integer :posicion
      t.references :contenido, index: true
      t.references :usuario, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_nivel0s, :contenidos
    add_foreign_key :menu_nivel0s, :usuarios
  end
end
