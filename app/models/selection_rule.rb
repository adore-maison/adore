class SelectionRule < ApplicationRecord
  belongs_to :product
  belongs_to :selection_standard
end
