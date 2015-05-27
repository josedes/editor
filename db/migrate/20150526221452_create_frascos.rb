class CreateFrascos < ActiveRecord::Migration
  def change
    create_table :frascos do |t|
      t.integer :numero
      t.date :fechaElaboracion
      t.date :fechaRetiro
      t.string :estado
      t.references :usuario

      t.timestamps null: false
    end
  end
end
