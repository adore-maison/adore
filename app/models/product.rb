class Product < ApplicationRecord
  enum stage: { basic_info: 0, selection_checks: 1, verify_demand: 2, competitor_analysis: 3, review_analysis: 4 }
  self.per_page = 7

end
