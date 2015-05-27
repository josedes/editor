class CreateMenu1s < ActiveRecord::Migration
  def change
    create_table :menu1s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.string :enlace
      t.references :menu0, index: true
      t.timestamps null: false
    end
    add_foreign_key :menu1s, :menu0s
  end
end
