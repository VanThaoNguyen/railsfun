class AddDifficultyLevelToProducts < ActiveRecord::Migration
  def change
    add_column :products, :difficulty_level, :string
  end
end
