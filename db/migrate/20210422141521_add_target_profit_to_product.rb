class AddTargetProfitToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :target_profit, :decimal, precision: 15, scale: 2
  end
end
