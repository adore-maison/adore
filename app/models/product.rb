class Product < ApplicationRecord
  enum stage: { basic_info: 0, intial_checks: 1, verifed_market_demand: 2, competitors_analysed: 3, reviews_analysed: 4, profit_first_calculation: 5, contacted_suppliers: 6, ordered_samples: 7, placed_order: 8, discarded: 9 }
  self.per_page = 7

  has_many :selection_rules
  has_many :selection_standards, through: :selection_rules
  has_many :keywords

  filterrific(
    default_filter_params: { sorted_by: 'updated_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_stage
    ]
  )

  scope :sorted_by, ->(sort_option) {
    direction = /desc$/.match?(sort_option) ? "desc" : "asc"
    case sort_option.to_s
    when /^created_at_/
      order("products.created_at #{direction}")
    when /^updated_at_/
      order("products.updated_at #{direction}")
    when /^comp_price_/
      order("products.comp_price #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ["created_at (newest first)", "created_at_desc"],
      ["created_at (oldest first)", "created_at_asc"],
      ["updated_at (newest first)", "updated_at_desc"],
      ["updated_at (oldest first)", "updated_at_asc"],
      ["price (high)", "comp_price_asc"],
      ["price (low)", "comp_price_desc"],
    ]
  end

  scope :search_query, ->(query) {
    return nil  if query.blank?

    terms = query.downcase.split(/\s+/)

    terms = terms.map { |e|
      (e.tr("*", "%") + "%").gsub(/%+/, "%")
    }

    num_or_conds = 1
    where(
      terms.map { |_term|
        "(LOWER(products.asin) LIKE ?)"
      }.join(" AND "),
      *terms.map { |e| [e] * num_or_conds }.flatten,
    )
  }

  scope :with_stage, ->(type_option) {
    case type_option.to_s
    when /^0/
      self.basic_info
    when /^1/
      self.intial_checks
    when /^2/
      self.verifed_market_demand
    when /^3/
      self.competitors_analysed
    when /^4/
      self.reviews_analysed
    when /^5/
      self.profit_first_calculation
    when /^6/
      self.contacted_suppliers
    when /^7/
      self.ordered_samples
    when /^8/
      self.placed_order
    when /^9/
      self.discarded
    else
      raise(ArgumentError, "Invalid sort option: #{type_option.inspect}")
    end
  }

end
