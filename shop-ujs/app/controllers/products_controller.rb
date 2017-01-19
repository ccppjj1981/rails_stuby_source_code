class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  # GET /products
  # GET /products.jsons
  def index
    #@products = Product.all
    ## perform a paginated query:
    @product = Product.new
    unless current_user.nil?
      @products = current_user.products.paginate(:page => params[:page],:per_page => 2)
    end
    #@products = Product.paginate(:page => params[:page],:per_page => 2)
    
    # or, use an explicit "per page" limit:
    #Product.paginate(:per_page => 1)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @product, status: :ok, location: @product }
      format.js
    end
  end

  # POST /products
  # POST /products.json
  def create
    #@user = User.find(params[:user_id])
    @product = current_user.products.build(product_params)
     #@product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        #format.json
        format.js
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        #format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
