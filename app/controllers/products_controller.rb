class ProductsController < ApplicationController
	before_action :signed_in_as_product_manager, :except =>[:show, :allproducts]
	before_action :signed_in_as_seller,  only: :allproducts

	def allproducts
		@products=Product.all
	end
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
		if current_user.usertype == 'P' and current_user.id!= @product.user_id 	
			puts current_user.usertype
		 redirect_to signin_url, notice: "你没有权限访问该页面"
	    end

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
		if current_user.usertype == 'P' and current_user.id!= @product.user_id 	
		 redirect_to signin_url, notice: "你没有权限访问该页面"
		end
	end

	private
       def product_params
       	params.require(:product).permit(:name,:description)
       end
end
