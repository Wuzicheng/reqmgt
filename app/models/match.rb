class Match < ActiveRecord::Base
	belongs_to :products
	belongs_to :requirements
end
