class AddCountriesToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :country, :string
  end
end
