class ApplicationsController < ApplicationController

def new
	@vacancies = Vacancy.all
	@vacancy = @vacancies.find(params[:id])
	@application = Application.new
end

def create
	@application = Application.new(application_params)
	if @application.save
		redirect_to session.delete(:return_to)
		
	else  
		render 'new'
	end
end

private
def application_params
	params.require(:application).permit(:firstname, :lastname, :phonenumber, :email, :expectedsalary, :linkedin, :github, :location, :currency)
end

end
