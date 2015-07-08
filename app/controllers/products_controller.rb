class ProductsController < ApplicationController
	def index
		@products = Product.all.includes(:category).published
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Successfully!"
      redirect_to products_url
    else
      flash[:notice] = "Not Working"
      render :new
  end

  def edit
    @product = Product.find(params[:id])
  end

	def create
		@product = Product.new(product_params)
		if @product.save
      flash[:notice] = 'you have a successfully created the product'
			redirect_to products_url
		else
      flash[:notice]= 'There is an error in the form'
			render :new
		end
	end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'You have a successfully updated this product'
      redirect_to products_url
    else
      flash[:notice] = "There is an error in the form"
      render :new
    end
  end

	private

	def product_params
		params.require(:product).permit(:title,
										:description,
										:price,
										:published,
										:category_id )
	end
end