module Api
    module V1
	class AtmsController < ApplicationController
	    skip_before_filter :authorize
	    # POST /atms
	    # POST /atms.json
	    def create
		@atm = Atm.new(params[:atm])
		respond_to do |format|
		    if @atm.save
			format.json { render text: "SUCCESS", status: :created }
		    else
			format.json { render json: @atm.errors, status: :unprocessable_entity }
		    end
		end
	    end

	    def nearby
		@atms = Atm.nearby(params[:latitude], params[:longitude], params[:radius], params[:bank])
		@status = @atms.blank? ? "NO_RESULTS" : "OK"
		self.response.headers["Content-Type"] = "application/json; charset=UTF-8"
	    end

	    def zipcode
		@atms = Atm.zipcode(params[:zipcode], params[:radius], params[:bank])
		@status = @atms.blank? ? "NO_RESULTS" : "OK"
	    end

	end
    end
end
