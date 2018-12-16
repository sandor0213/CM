class MemberparamsController < ApplicationController
	before_action :authorize
	before_action :find_member_params, only: [:edit, :update]
	before_action :find_member_for_memberparams_variant2, only: [:new, :create]
 	def index
  	end

  	def new
  		@memberparam = Memberparam.new
  	end

  	def create
  		@memberparam = @member.build_memberparam(member_params)
  		if @memberparam.save
  			redirect_to memberparam_path(@memberparam.id)
  		else
  			render 'new'
  		end	
  	end

  	def show
  		@member = Member.find_by(id: session[:member_id])
  		@memberparam = @member.memberparam
  	end

	def edit
  	end

  	def update
  		if @memberparam.update(member_params)
  			redirect_to memberparam_path(@memberparam.id)
  		else
  			render 'edit'
  		end
  	end

  	def destroy
  	end


  private
	def member_params
		params.require(:memberparam).permit(:avatar, :member_id, :position, :email, :skype, :phonenumber, :emergencyname, :emergencyphonenumber, :birthday)
	end

	def find_member_params
		@memberparam = current_member.memberparam
	end

	def find_member_for_memberparams_variant2
		@member = Member.find_by(id: session[:member_id])
	end

end

 