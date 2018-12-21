class MembersController < ApplicationController
before_action :find_member, only: [:destroy]

def new
	@member = Member.new
end

def create 
	@member = Member.new(member_params)
	if @member.save
		session[:member_id] = @member.id
		flash[:notice] = "Registration has been successful"
		redirect_to new_memberparam_path
	else
		render 'new'
	end
end


def login_member
	@member = Member.new
end

def checkCredentials_member
	@member = Member.find_by(username: params[:member][:username], password: params[:member][:password])
	# binding.pry
	if @member != nil
		session[:member_id] = @member.id
		flash[:notice] = "Login success"
		redirect_to root_path

	else 
		flash[:error] = "error"
		@member = Member.new
      render 'login_member'
	end
end

def logout_member
	session[:member_id] = nil
	flash[:notice] = "Log out success"
	redirect_to root_path
end


def destroy 
	if @member.destroy
		redirect_to root_path
		session[:member_id] = nil
	end
end



private
def member_params
	params.require(:member).permit(:username, :password, :passwordconfirmation, :promocode, :firstname, :lastname)
end

def find_member
	@member = Member.find(params[:id])
end

end