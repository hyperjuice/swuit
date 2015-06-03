class ProductsController < ApplicationController
  before_action :set_user
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:type, :description, :address, :latitude, :longitude, :price, :availability)
    product = Product.create(product_params)
    @user.products << product
    redirect_to [@user, product]
  end

  def edit
  end

  def update
    product_params = params.require(:product).permit(:type, :description, :address, :latitude, :longitude, :price, :availability)
    @product.update(product_params)
    redirect_to [@user, @product]
  end

  def show
  end

  def destroy
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