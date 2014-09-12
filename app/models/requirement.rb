class Requirement < ActiveRecord::Base
	belongs_to :users
	has_many :matches,dependent: :destroy
	default_scope ->{order('created_at DESC')}
	validates :user_id, :name, presence:true
end
