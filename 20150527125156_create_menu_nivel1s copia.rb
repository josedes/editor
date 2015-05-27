class CreateMenuNivel1s < ActiveRecord::Migration
  def change
    create_table :menu_nivel1s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.string :enlace
      t.references :MenuNivel0, index: true
      t.references :Contenidos, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_nivel1s, :MenuNivel0
    add_foreign_key :menu_nivel1s, :contenido
  end
end
