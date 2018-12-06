class VacanciesController < ApplicationController
before_action :find_vacancy, except: [:index, :new, :create]
before_action :authenticate_user!, only: [:index, :show]

def index
	@vacancies = Vacancy.all.order("deadline ASC")
end

def new
	@vacancy = Vacancy.new
end

def create
	@vacancy = Vacancy.new(vacancy_params)
	if @vacancy.save
		redirect_to vacancy_path(@vacancy.id)
	else
		render 'new'
	end
end

def show
end

def edit
end

def update
	if @vacancy.update(vacancy_params)
		redirect_to vacancy_path(@vacancy.id)
	else
		render 'edit'
	end
end

def destroy
	@vacancy.destroy
	redirect_to vacancies_path
end

private

def find_vacancy
	@vacancy = Vacancy.find(params[:id])
end

def vacancy_params
	params.require(:vacancy).permit(:title, :description, :experience, :deadline)
end

end
