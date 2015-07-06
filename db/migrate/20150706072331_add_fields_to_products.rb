class AddFieldsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :price, :decimal, precision: 6, scale: 2
  	add_column :products, :published, :boolean
  	add_column :products, :short_description, :string
  end
end
