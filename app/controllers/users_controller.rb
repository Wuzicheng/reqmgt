class UsersController < ApplicationController
	before_action :signed_in_as_admin

	def new
		@user=User.new
	end 

	def index
		@users=User.all
	end
	
	def show
		@user=User.find_by(params[:id])
    end

    def create
    	@user=User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def edit
		@user = User.find_by(params[:id])
	end

	private
       def user_params
       	params.require(:user).permit(:name,:email,:password,:password_confirmation,:usertype)
       end
end
