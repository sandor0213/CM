Rails.application.routes.draw do
	

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :applicants
	resources :meetrooms
	get "/meetrooms/:id/reservations", to: "reservations#reservationwithmeetroomid", as: :reservationwithmeetroomid
	post "/reservationid/:id", to: "reservations#createid", as: :reservationid
	get "login_member", to: "members#login_member"
	post "checkCredentials_member", to: "members#checkCredentials_member"
	get "logout_member/:id", to: "members#logout_member", as: :logout_member
	resources :reservations
	resources :vacancies
	resources :applications
	resources :memberparams
	resources :members
	root "companies#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
