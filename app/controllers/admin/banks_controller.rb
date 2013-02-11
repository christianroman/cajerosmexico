module Admin
    class BanksController < BaseController
	# GET /banks
	# GET /banks.json
	def index
	    @banks = Bank.all

	    respond_to do |format|
		format.html # index.html.erb
	    end
	end

	# GET /banks/1
	# GET /banks/1.json
	def show
	    @bank = Bank.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /banks/new
	# GET /banks/new.json
	def new
	    @bank = Bank.new

	    respond_to do |format|
		format.html # new.html.erb
	    end
	end

	# GET /banks/1/edit
	def edit
	    @bank = Bank.find(params[:id])
	end

	# POST /banks
	# POST /banks.json
	def create
	    @bank = Bank.new(params[:bank])

	    respond_to do |format|
		if @bank.save
		    format.html { redirect_to [:admin, @bank], notice: 'Bank was successfully created.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /banks/1
	# PUT /banks/1.json
	def update
	    @bank = Bank.find(params[:id])

	    respond_to do |format|
		if @bank.update_attributes(params[:bank])
		    format.html { redirect_to [:admin, @bank], notice: 'Bank was successfully updated.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /banks/1
	# DELETE /banks/1.json
	def destroy
	    @bank = Bank.find(params[:id])
	    @bank.destroy

	    respond_to do |format|
		format.html { redirect_to admin_banks_url }
	    end
	end
    end
end
