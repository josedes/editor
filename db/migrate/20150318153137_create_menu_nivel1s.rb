class CreateMenuNivel1s < ActiveRecord::Migration
  def change
    create_table :menu_nivel1s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.references :MenuNivel0, index: true
      t.references :contenido, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_nivel1s, :MenuNivel0s
    add_foreign_key :menu_nivel1s, :contenidos
  end
end
