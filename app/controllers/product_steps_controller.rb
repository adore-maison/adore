class ProductStepsController < ApplicationController
  include Wicked::Wizard

  steps :basic_info, :verify_demand, :selection_checks, :competitor_analysis, :review_analysis

  def show
    @product = Product.new
    render_wizard
  end
end
