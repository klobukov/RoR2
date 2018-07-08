Rails.application.routes.draw do
  root 'static_pages#home'

  # создадим именованый маршрут help. так же создастя help_url и help_path
  # это полная ссылка и частичная /help
  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  # запрос /contact отправить контроллеру static_pages методу contact
  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
