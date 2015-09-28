Rails.application.routes.draw do
	constraints subdomain: 'www' do
		get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
	end

	root 'home#index'

	resources :contacts, only: [:create]
end
