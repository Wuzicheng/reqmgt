class MatchesController < ApplicationController
	def createfromRequirement
		@match = Match.new(match_params)
		#@product=Product.new(product_params)
		if @match.save
			redirect_to requirement_path(match_params[:requirement_id])
		else
			#TBD ERROR
		end
	end

	 def deletefromRequirement
    	@match = Match.find(match_params[:id])
    	@match.destroy
		redirect_to requirement_path(match_params[:requirement_id])
	end

	def createfromProduct
		@match = Match.new(match_params)
		#@product=Product.new(product_params)
		if @match.save
			redirect_to product_path(match_params[:product_id])
		else
			#TBD ERROR
		end
	end
    
    def deletefromProduct
    	@match = Match.find(match_params[:id])
    	@match.destroy
		redirect_to product_path(match_params[:product_id])
    end

    def addcomment
        @match = Match.find(match_params[:id])
        if @match.update(match_params)
        	redirect_to requirement_path(match_params[:requirement_id])
        else
			#TBD ERROR
		end
	end


	private
       def match_params
       	params.require(:match).permit(:id, :product_id,:requirement_id,:comments)
       end
end
