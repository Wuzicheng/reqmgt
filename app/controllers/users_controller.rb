class UsersController < ApplicationController
	before_action :signed_in_as_admin

	def index
		@users=User.all
	end
	
	def show
		@user=User.find_by(params[:id])
    end


end
