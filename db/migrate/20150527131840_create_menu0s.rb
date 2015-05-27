class CreateMenu0s < ActiveRecord::Migration
  def change
    create_table :menu0s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.string :enlace
      t.references :contenido, index: true
      t.timestamps null: false
    end
    add_foreign_key :menu0s, :contenidos
  end
end
