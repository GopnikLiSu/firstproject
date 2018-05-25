Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # REVU: Use resource naming style
  # REVU: home/my_currency => /currencies
  # REVU: If currency is specified => /currencies/usd

  get 'home/my_currency' => 'home#my_currency'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
