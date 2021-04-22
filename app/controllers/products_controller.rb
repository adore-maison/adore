class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific]
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    product = grab_asin_details

    @product = Product.new(product_params)
    @product.description = product[:description]
    @product.photo_url = product[:photo_url]
    @product.comp_price = product[:comp_price]
    @product.comp_rating = product[:comp_rating]
    @product.main_category = product[:main_category]
    @product.comp_review_count = product[:comp_review_count]

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update #TODO optimise
    product = grab_asin_details
    @product_details = product_params
    if !product_params[:description].present? && product[:description].present?
      @product_details['description'] = product[:description]
      @product_details['photo_url'] = product[:photo_url]
      @product_details['comp_price'] = product[:comp_price]
      @product_details['comp_rating'] = product[:comp_rating]
      @product_details['main_category'] = product[:main_category]
      @product_details['comp_review_count'] = product[:comp_review_count]
    end

    if @product.update(@product_details)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:asin, :description, :stage, :photo_url, :comp_price, :comp_rating, :comp_review_count, :main_category,:hsn, :comp_sales, :comp_revenue, :comp_fba_fees, :main_keyword, :factory_price, :dimension, :weight_kg, :target_selling_price, :launch_price, :units_needed_to_rank, :units_per_master_carton, :target_sales_per_day, :mfg_time_days, :ship_to_amz_days, :target_ppc_tacos, :inspection_cost, :estimated_unusable_units_perc, :other_costs, :units_needed_to_rank, :inventory_roll_per_year, :comments, :potential, :target_profit, selection_standard_ids: [])
    end

    def grab_asin_details
      product = AsinGrabberService.new(product_params[:asin]).perform
      Rails.logger.info product.to_s
      product
    end
end
