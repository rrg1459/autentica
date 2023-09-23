Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  get 'pagina/indice'

  devise_for :users

  resources :users, except: [:new, :create]
  resources :posts
  resources :productos
  resources :dolars, only: [:edit, :update]

  devise_scope :user do
    authenticated :user do
      # root 'modulos#inicial'
      root to: 'posts#index'
    end
    unauthenticated :user do
      # root 'devise/sessions#new'
      root 'productos#index'
    end
  end

  get '/administradores'             => 'posts#index'

  get   'documento'                  => 'modulos#inicial'
  get   '/preguntas_frecuentes/'     => 'pagina#preguntas_frecuentes'
  get   '/generar_pdf/:texto'        => 'modulos#generar_pdf',      as: 'generar_pdf'
  patch '/nueva_clave/:id'           => 'users#nueva_clave',        as: 'nueva_clave'
  get   '/cambiar_clave/:id'         => 'users#cambiar_clave',      as: 'cambiar_clave'

  get "/sw.js", to: redirect('/404.html')

end
