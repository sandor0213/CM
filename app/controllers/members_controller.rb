class MembersController < ApplicationController
before_action :find_member, only: [:destroy]

def new
	@member = Member.new
end

def create 
	@member = Member.new(member_params)
	if @member.save
		session[:member_id] = @member.id
		redirect_to new_memberparam_path
	else
		redirect 'new'
	end
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