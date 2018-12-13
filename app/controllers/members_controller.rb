class MembersController < ApplicationController


def new
	@member = Member.new
end

def create 
	@member = Member.new(member_params)
	if @member.save

		session[:member_id] = @member.id

		redirect_to new_memberparam_path
		$logged = true
	else
		redirect 'new'
	end
end

private
def member_params
	params.require(:member).permit(:username, :password, :passwordconfirmation, :promocode, :firstname, :lastname)
end

end