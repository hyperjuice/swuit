class MapController < ApplicationController

	def index
	  @products = Product.all
	end
  
  def map
  	@products = Product.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @products}
  	end
  end
end