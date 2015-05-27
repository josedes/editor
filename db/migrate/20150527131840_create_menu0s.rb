class CreateMenu0s < ActiveRecord::Migration
  def change
    create_table :menu0s do |t|
      t.string :titulo
      t.integer :tipo
      t.integer :estado
      t.integer :posicion
      t.string :enlace
      t.timestamps null: false
    end
  end
end
