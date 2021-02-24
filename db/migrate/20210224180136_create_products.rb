class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :asin
      t.text :description
      t.integer :no_potos
      t.decimal :l_cm, precision: 15, scale: 2
      t.decimal :b_cm, precision: 15, scale: 2
      t.decimal :h_cm, precision: 15, scale: 2
      t.decimal :weight_kg, precision: 15, scale: 2
      t.decimal :target_selling_price, precision: 15, scale: 2
      t.decimal :launch_price, precision: 15, scale: 2
      t.integer :units_needed_to_rank
      t.integer :units_per_master_carton
      t.integer :target_sales_per_day
      t.integer :mfg_time_days
      t.integer :ship_to_amz_days
      # RF
      t.decimal :amz_referal_rate, precision: 15, scale: 2
      t.decimal :amz_fixed_closing_fee, precision: 15, scale: 2
      t.decimal :fba_fees, precision: 15, scale: 2
      t.decimal :gst_on_fees, precision: 15, scale: 2
      # AAO
      t.decimal :target_ppc_tacos, precision: 15, scale: 2
      t.decimal :estimated_unusable_units_perc, precision: 15, scale: 2
      t.decimal :bank_charges, precision: 15, scale: 2

      # SS
      t.decimal :monthly_storage, precision: 15, scale: 2
      t.decimal :shipping, precision: 15, scale: 2
      t.decimal :inventory_placement, precision: 15, scale: 2
      t.decimal :other_shipping_storage_charges, precision: 15, scale: 2

      # MANUFACTURING & CREATIVE EXPENSES
      t.integer :order_quantity
      t.decimal :factory_price, precision: 15, scale: 2
      t.decimal :manuf_labels_cost_perc, precision: 15, scale: 2
      t.decimal :manuf_box_cost_perc, precision: 15, scale: 2
      t.decimal :manuf_mould_cost_perc, precision: 15, scale: 2
      t.decimal :manuf_print_cost_perc, precision: 15, scale: 2
      t.decimal :manuf_other_cost_perc, precision: 15, scale: 2
      t.decimal :manuf_inspection_cost, precision: 15, scale: 2

      # Freight & Customs
      t.decimal :fc_freight, precision: 15, scale: 2
      t.decimal :fc_customs, precision: 15, scale: 2
      t.decimal :fc_cartons, precision: 15, scale: 2
      t.decimal :fc_freight_forwarder_fees, precision: 15, scale: 2

      # Creative
      t.decimal :c_photographer, precision: 15, scale: 2
      t.decimal :c_photo_edits, precision: 15, scale: 2
      t.decimal :c_stock_images, precision: 15, scale: 2
      t.decimal :c_other_1, precision: 15, scale: 2
      t.decimal :c_other_2, precision: 15, scale: 2


      t.decimal :other_costs, precision: 15, scale: 2
      t.decimal :inventory_roll_per_year, precision: 15, scale: 2

      t.timestamps
    end
  end
end
