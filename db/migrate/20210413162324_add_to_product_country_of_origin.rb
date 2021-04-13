class AddToProductCountryOfOrigin < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :country_of_origin, :integer, default: 0
  end
end
