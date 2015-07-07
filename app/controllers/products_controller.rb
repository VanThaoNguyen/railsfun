class ProductsController < ApplicationController
	def index
		@product = Product.all.includes(:category).published
	end
end
