class Product < ApplicationRecord
  enum stage: { basic_info: 0, intial_checks: 1, verifed_market_demand: 2, competitors_analysed: 3, reviews_analysed: 4, profit_first_calculation: 5, contacted_suppliers: 6, ordered_samples: 7, placed_order: 8 }
  self.per_page = 7

  has_many :selection_rules
  has_many :selection_standards, through: :selection_rules
  has_many :keywords

end
