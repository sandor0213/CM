class MeetroomsController < ApplicationController
	before_action :find_meetroom, except: [:index, :new, :create]

	def index 
	@meetrooms = Meetroom.all

	end

	def new 
		@meetroom = Meetroom.new
	end

	def create 
		@meetroom = Meetroom.new(meetroom_params)
		if @meetroom.save
			redirect_to meetroom_path(@meetroom.id)
		end
	end

	def show 
	@reservations = Reservation.all
	end

	def edit 

	end

	def update 
		if @meetroom.update(meetroom_params)
			redirect_to meetroom_path(@meetroom.id)
		end
	end

	def destroy 
		@meetroom.destroy
		redirect_to meetrooms_path
	end

	private
	def meetroom_params
		params.require(:meetroom).permit(:number, :title)
	end

	def find_meetroom
		@meetroom = Meetroom.find(params[:id])
	end

end
