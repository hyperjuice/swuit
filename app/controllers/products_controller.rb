class ProductsController < ApplicationController
  before_action :set_user
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:kind, :description, :address, :latitude, :longitude, :price, :availability)
    product = Product.create(product_params)
    @user.products << product
    redirect_to [@user, product]
  end

  def edit
    authorize @product
  end

  def update
    product_params = params.require(:product).permit(:kind, :description, :address, :latitude, :longitude, :price, :availability)
    @product.update(product_params)
    redirect_to [@user, @product]
  end

  def show
    authorize @product
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to user_products_path, Notice: "The product was successfully destroyed."
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end