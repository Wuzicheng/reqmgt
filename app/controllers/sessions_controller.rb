class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user&&user.authenticate(params[:session][:password])
			sign_in user
			if user.usertype =="A"
				redirect_to users_path
			elsif user.usertype == "S"
				redirect_to requirements_path
			else user.usertype == "P"
				redirect_to products_path
			end
		else
			#create error message
			flash.now[:error]="错误的用户名或者密码"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_path
	end
end
