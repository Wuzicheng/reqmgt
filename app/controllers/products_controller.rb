class ProductsController < ApplicationController
	before_action :signed_in_as_product_manager
	def new
		@product=Product.new
	end

	def create
		@product = current_user.products.build(product_params)
		#@product=Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
		#@products = Product.all
		@products=current_user.products

		respond_to do |format|
			format.html
		end
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def edit
		@product = Product.find_by(params[:id])
	end

	private
       def product_params
       	params.require(:product).permit(:name,:description)
       end
end
