class MapController < ApplicationController

	def index
	  @products = Product.all
    # @user = User.find(params[:user_id])
    # @product = Product.find(params[:id])
	end



  def map
  	@products = Product.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @products}
  	end
  end
end