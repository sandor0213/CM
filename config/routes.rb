Rails.application.routes.draw do
	post "/reservationid/:id", to: "reservations#createid", as: :reservationid
	resources :meetrooms
	resources :reservations
	# get '/random/', to: 'answers#random', as: 'random'
	get "/meetrooms/:id/reservations", to: "reservations#reservationwithmeetroomid", as: :reservationwithmeetroomid
	

	root "companies#index"



 # get '/login', to: 'users#login'
  # post '/result', to: 'users#result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
