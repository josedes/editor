class CreateFrascos < ActiveRecord::Migration
  def change

  	#se esta tomanto text para guardar algun comentario adicional 
  	#en el mismo campo, pero sino es necesario mejor 
    create_table :frascos do |t|
      t.text:frasco1
      t.text:frasco2
      t.text:frasco3
      t.text:frasco4
      t.text:frasco5
      t.text:frasco6
      t.text:frasco7
      t.text:frasco8
      t.text:frasco9
      t.text:frasco10
      t.text:frasco11
      t.text:frasco12
      t.text:frasco13
      t.text:frasco14
      t.text:frasco15
      t.text:frasco16
      t.text:frasco17
      t.text:frasco18
      t.text:frasco19
      t.text:frasco20
      t.text:frasco21
      t.text:frasco22
      t.text:frasco23
      t.text:frasco24
      t.text:frasco25
      t.text:frasco26
      t.text:frasco27
      t.text:frasco28
      t.text:frasco29
      t.text:frasco30
      t.text:frasco31
      t.text:frasco32
      t.text:frasco33
      t.text:frasco34
      t.text:frasco35
      t.text:frasco36
      t.text:frasco37
      t.text:frasco38
      t.text:frasco39
      t.text:frasco40

      t.references :usuario

      t.timestamps null: false
    end
  end
end
