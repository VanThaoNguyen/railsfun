class RemoveShortDescriptionInProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :short_description, :string
  end
end
