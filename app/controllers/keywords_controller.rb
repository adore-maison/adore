class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create]


  # GET /keywords
  def index
    @keywords = Keyword.paginate(page: params[:page]).order(created_at: :desc)
  end

  # GET /keywords/1
  def show
  end

  # GET /keywords/new
  def new
    @keyword = @product.keywords.new
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords
  def create
    @keyword = @product.keywords.build(keyword_params)

    if @keyword.save
      redirect_to @product, notice: 'Keyword was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /keywords/1
  def update
    if @keyword.update(keyword_params)
      redirect_to @product, notice: 'Keyword was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /keywords/1
  def destroy
    @keyword.destroy
    redirect_to keywords_url, notice: 'Keyword was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    def set_product
      # use params.require to use strong params
      @product = Product.find(params.require(:product_id))
    end

    # Only allow a list of trusted parameters through.
    def keyword_params
      params.require(:keyword).permit(:phrase, :volume, :ciq_score, :cpr_eight_day_giveaway)
    end
end
