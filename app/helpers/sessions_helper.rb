module SessionsHelper

	def sign_in(user)
		remember_token= User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		cookies.permanent[:user_type]=user.usertype
        cookies.permanent[:name]=user.name
		user.update_attribute(:remember_token, User.hash(remember_token))
		self.current_user = user
	end

	def sign_out
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
    cookies.delete(:user_type)
    cookies.delete(:name)
    end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
         @current_user = user
    end

    def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
    end

   def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "请登录"
    end
    end

    def signed_in_as_product_manager
    	unless signed_in?&&cookies[:user_type]=='P'
    		redirect_to signin_url, notice: "请以产品经理身份登录"
    end
    	#TBD
    end

    def signed_in_as_seller
    	unless signed_in?&&cookies[:user_type]=='S'
    		redirect_to signin_url, notice: "请以销售经理身份登录"
        end
    end   

    def signed_in_as_admin
    	unless signed_in?&&cookies[:user_type]=='A'
    		redirect_to signin_url, notice: "请以管理员身份登录"
        end
    end
end
