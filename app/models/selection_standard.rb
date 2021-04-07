class SelectionStandard < ApplicationRecord
  has_many :selection_rules

  enum filter_type: { product_eval: 0, market_eval: 1  }
end
