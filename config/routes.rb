Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'

  get 'answer', controller: :chatbot
  get 'add_to_cart', controller: :aux
  get 'check_cart_items', controller: :aux
end
