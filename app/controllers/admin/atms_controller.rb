module Admin
    class AtmsController < BaseController
	# GET /atms
	# GET /atms.json
	def index
	    #@atms = Atm.limit(100)
	    @atms = Atm.order('id DESC').page(params[:page]).per(20)

	    respond_to do |format|
		format.html # index.html.erb
	    end
	end

	# GET /atms/1
	# GET /atms/1.json
	def show
	    @atm = Atm.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /atms/new
	# GET /atms/new.json
	def new
	    @atm = Atm.new

	    respond_to do |format|
		format.html # new.html.erb
	    end
	end

	# GET /atms/1/edit
	def edit
	    @atm = Atm.find(params[:id])
	end

	# POST /atms
	# POST /atms.json
	def create
	    @atm = Atm.new(params[:atm])

	    respond_to do |format|
		if @atm.save
		    format.html { redirect_to [:admin, @atm], notice: 'Atm was successfully created.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /atms/1
	# PUT /atms/1.json
	def update
	    @atm = Atm.find(params[:id])

	    respond_to do |format|
		if @atm.update_attributes(params[:atm])
		    format.html { redirect_to [:admin, @atm], notice: 'Atm was successfully updated.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /atms/1
	# DELETE /atms/1.json
	def destroy
	    @atm = Atm.find(params[:id])
	    @atm.destroy

	    respond_to do |format|
		format.html { redirect_to admin_atms_url }
	    end
	end

    end
end
