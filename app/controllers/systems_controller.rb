class SystemsController < ApplicationController
	def index
		@systems = Manager.all
	end

	def show
		@system = Manager.find(params[:id])
	end

	def create
		@system = Manager.new(params[:manager].symbolize_keys)
		if @system.save
			redirect_to systems_path
		else
			render :new
		end
	end

	def new
		@system = Manager.new
	end

	def edit
		@system = Manager.find(params[:id])
	end

	def update
		# binding.pry
		@system = Manager.find(params[:id])
		if @system.update_attributes(params[:manager].symbolize_keys)
			redirect_to systems_path
		else
			render :edit
		end
	end

	def destroy
		@system = Manager.find(params[:id])
		@system.destroy
		redirect_to systems_path
	end
	
	private
	 def manager_params
      params.require(:manager).permit(:name, :surname, :age, :email, :skype)
    end
end
