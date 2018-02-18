class CreateReptiles < ActiveRecord::Migration[5.1]
  def change
    create_table :reptiles do |t|
      t.string :name
      t.string :specie
      t.date :birthday
      t.string :gender
      t.string :weight
      t.string :morphological_pattern
      t.string :morphological_father
      t.string :morphological_mother
      t.boolean :new_animal

      t.timestamps
    end
  end
end
