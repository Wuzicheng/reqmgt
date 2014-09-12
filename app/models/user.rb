class User < ActiveRecord::Base
  has_many :products
  has_many :requirements
	before_create :create_remember_token
	has_secure_password
	before_save {self.email = email.downcase}


 def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
