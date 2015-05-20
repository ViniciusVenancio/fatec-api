class EnterpriseController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@enterprises = Enterprise.all
		
		respond_to do |format|
			format.json { render json: @enterprises.to_json }
		end
	end

	def show
		@enterprise = Enterprise.find(params[:id])

		respond_to do |format|
			format.json { render json: @enterprise.to_json }
		end
	end
end