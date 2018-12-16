class ApplicationController < ActionController::Base

$super_member_code_string = "superuser"
$member_code_string = "azinec"

def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def authorize
    redirect_to login_member_path unless current_member
  end

def company_member
	@company_member = current_member.promocode == $member_code_string
end
helper_method :company_member

def super_member
	@super_member = current_member.promocode == $super_member_code_string
end
helper_method :super_member


def isLogined_anyone
	  redirect_to new_applicant_session_path unless (current_member || applicant_signed_in?)
  end


    
end
