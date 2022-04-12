class AddDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :kirby, :string
    add_column :products, :monster_hunter, :string
    add_column :products, :super_smash_bros, :string
    add_column :products, :super_mario, :string
    add_column :products, :splatoon, :string
    add_column :products, :zelda_botw, :string
    add_column :products, :animal_crossing, :string
  end
end
