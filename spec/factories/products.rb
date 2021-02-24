FactoryBot.define do
  factory :product do
    asin { "MyString" }
    description { "MyText" }
    no_potos { "" }
    factory_price { "9.99" }
    dimension { "" }
    weight_kg { "9.99" }
    target_selling_price { "9.99" }
    launch_price { "9.99" }
    units_needed_to_rank { "" }
    units_per_master_carton { "" }
    target_sales_per_day { "" }
    mfg_time_days { "" }
    ship_to_amz_days { "" }
    tarrif_rate { "9.99" }
    transaction_fees { "" }
    target_ppc_tacos { "9.99" }
    inspection_cost { "9.99" }
    estimated_unusable_units_perc { "9.99" }
    other_costs { "9.99" }
    units_needed_to_rank { "" }
    inventory_roll_per_year { "9.99" }
  end
end
