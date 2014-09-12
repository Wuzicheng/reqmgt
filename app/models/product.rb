class Product < ActiveRecord::Base
	belongs_to :users
	has_many :matches
	default_scope ->{order('created_at DESC')}
	validates :user_id, presence:true
end
