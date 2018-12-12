class ApplicationsController < ApplicationController

def index
	@vacancies = Vacancy.all
	@vacancy = @vacancies.find(params[:id])
	@applications = Application.find(params[:id])
end

def new
	@vacancy = Vacancy.find(params[:id])
	@application = Application.new
end

def create
	@vacancy = Vacancy.find(params[:id])
	@application = @vacancy.applications.build(application_params)
	if @application.save
		redirect_to session.delete(:return_to)
		
	else  
		render 'new'
	end
end



private
def application_params
	params.require(:application).permit(:vacancy_id, :firstname, :lastname, :phonenumber, :email, :expectedsalary, :linkedin, :github, :location, :currency)
end

end

	