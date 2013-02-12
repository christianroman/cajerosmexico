module Api
    module V1
	class ReportsController < ApplicationController
	    skip_before_filter :authorize

	    def create
		@report = Report.new(params[:report])
		respond_to do |format|
		    if @report.save
			format.json { render :json => { :status => "OK" }, status: :created }
		    else
			format.json { render json: @report.errors, status: :unprocessable_entity }
		    end
		end
	    end
	end
    end
end
