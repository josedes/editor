class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :fechaPago
      t.integer :tipoPago
      t.string :numero
      t.string :banco
      t.decimal :monto
      t.references :usuarios

      t.timestamps null: false
    end
  end
end
