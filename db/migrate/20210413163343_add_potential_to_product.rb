class AddPotentialToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :potential, :integer, default: 0
  end
end
