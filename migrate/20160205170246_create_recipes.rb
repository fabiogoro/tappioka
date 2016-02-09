class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :cuisine, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true
      t.references :preference, index: true, foreign_key: true
      t.integer :servings
      t.integer :ready_in
      t.string :difficulty
      t.text :ingredients
      t.text :directions
      t.string :photo

      t.timestamps null: false
    end
  end
end
