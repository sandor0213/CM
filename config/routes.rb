Rails.application.routes.draw do
	
	resources :meetrooms
	get "/meetrooms/:id/reservations", to: "reservations#reservationwithmeetroomid", as: :reservationwithmeetroomid
	post "/reservationid/:id", to: "reservations#createid", as: :reservationid
	resources :reservations

	root "companies#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
