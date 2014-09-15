class RequirementsController < ApplicationController
	before_action :signed_in_as_seller, except: [:allrequirements,:show]
	before_action :signed_in_as_product_manager,  only: :allrequirements

	def allrequirements
		@requirements=Requirement.all
	end

	def new
		@requirement=Requirement.new
	end

	def create
		@requirement=current_user.requirements.build(requirement_params)
		if @requirement.save
			current_user.monthly_flag=1
			current_user.save
			redirect_to requirements_path
		else
			render :new
		end
	end

	def destroy
		@requirement=Requirement.find(params[:id])
		if @requirement.destroy && @requirement.created_at.year ==Time.now.year && @requirement.created_at.month == Time.now.month
			current_user.monthly_flag = 0
			current_user.save
		end
		redirect_to requirements_path
	end

	def show
		@requirement=Requirement.find(params[:id])
		puts current_user.usertype
		 if current_user.usertype == 'S' && current_user.id!= @requirement.user_id then
		 redirect_to signin_url, notice: "你没有权限访问该页面"
		end

		@products=current_user.products
		@match=Match.new
	end

	def index
		#@requirements=Requirement.all
		@requirements=current_user.requirements

		respond_to do |format|
			format.html
		end
	end

	def update
		@requirement=Requirement.find(params[:id])
		if @requirement.update(requirement_params)
			redirect_to requirement_path
		else
			render :edit
		end
	end

	def edit
		@requirement=Requirement.find(params[:id])
		 if current_user.usertype == 'S' && current_user.id!= @requirement.user_id 	
		 redirect_to signin_url, notice: "你没有权限访问该页面"
		end
	end

	private
       def requirement_params
       	params.require(:requirement).permit(:name,:description)
       end
end

