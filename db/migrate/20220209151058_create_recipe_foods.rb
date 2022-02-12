class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.decimal :quantity, precision: 5, scale: 2
      t.integer :recipe_id
      t.integer :food_id

      t.timestamps
    end
  end
end
