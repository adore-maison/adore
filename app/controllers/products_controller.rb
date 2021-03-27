class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.paginate(page: params[:page]).order(created_at: :desc)
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
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
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
      params.require(:product).permit(:asin, :description, :photo_url, :comp_price, :comp_sales, :comp_revenue, :comp_fba_fees, :comp_rating, :comp_review_count, :main_keyword, :main_category, :factory_price, :weight_kg, :target_selling_price, :launch_price, :units_needed_to_rank, :units_per_master_carton, :target_sales_per_day, :mfg_time_days, :ship_to_amz_days, :target_ppc_tacos, :inspection_cost, :estimated_unusable_units_perc, :other_costs, :units_needed_to_rank, :inventory_roll_per_year)
    end
end
