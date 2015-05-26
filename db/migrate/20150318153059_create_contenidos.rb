class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.string :titulo
      t.text :contenido

      t.timestamps null: false
    end
  end
end
