class ApplicationController < ActionController::Base




def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def authorize
    redirect_to login_member_path unless current_member
  end

def super_member
	@super_member = current_member.promocode == "azinec"
end
helper_method :super_member

    
end
