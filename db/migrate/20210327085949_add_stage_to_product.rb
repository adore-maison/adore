class AddStageToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stage, :integer, default: 0
    add_column :products, :comp_price, :decimal, precision: 15, scale: 2
    add_column :products, :comp_sales, :integer, default: 0
    add_column :products, :comp_revenue, :integer, default: 0
    add_column :products, :comp_fba_fees, :decimal, precision: 15, scale: 2
    add_column :products, :comp_rating, :decimal, precision: 15, scale: 2
    add_column :products, :comp_review_count, :integer, default: 0
    add_column :products, :main_keyword, :string
    add_column :products, :comments, :text
  end
end
