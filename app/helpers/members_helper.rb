module MembersHelper

   # Returns true if the user is logged in, false otherwise.
   def logged_in?
       !member.nil?
   end

   # Confirms a logged-in user.
   def logged_in_member
      unless logged_in?
         flash[:danger] = "Please log in."
         redirect_to root_path
      end
   end


end
