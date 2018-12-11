class ApplicationsController < ApplicationController

def new
	@vacancies = Vacancy.all
	@vacancy = @vacancies.find(params[:id])
	@application = Application.new
end

def create
	redirect_to root_path
end



end
