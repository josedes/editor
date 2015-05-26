class CreateMenuNivel2s < ActiveRecord::Migration
  def change
    create_table :menu_nivel2s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.string :MenuNivel1references
      t.references :contenido, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_nivel2s, :contenidos
  end
end
