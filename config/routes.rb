Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/start" => 'steps#step1', as: :step1
  post "/start" => 'passwords#verify', defaults: {step: 1}

  get "/congratulations" => 'steps#step2', as: :step2
  post "/congratulations" => 'passwords#verify', defaults: {step: 2}

  get "/step3_pre" => 'steps#step3_pre', as: :step3_pre
  post "/step3_pre" => 'passwords#verify', defaults: {step: 3}

  match "/encrypt" => 'encrypt#rot19', as: :encrypt, via: [:get, :post]

  get "/step3" => 'steps#step3', as: :step3
  post "/step3" => 'passwords#verify', defaults: {step: 4}

  get "/step4" => 'steps#fake_step4', as: :fake_step4

  get "/step_delta" => 'steps#step4', as: :step4
  post "/step_delta" => 'passwords#verify', defaults: {step: 5}

  get "/step_42" => 'steps#step5', as: :step5
  post "/step_42" => 'steps#step5'

  get "/there-will-be-cake" => 'steps#step6', as: :step6
  post "/there-will-be-cake" => 'steps#step6'

  get "/there-is-no-cake" => 'steps#step7', as: :step7
  post "/there-is-no-cake" => 'passwords#verify', defaults: {step: 8}

  get "/secure-step" => 'steps#step8', as: :step8
  post "/secure-step" => "passwords#verify", defaults: {step: 9}

  get "/here-is-your-cake" => 'steps#finish', as: :finish

  get "/ok-ik-wil-een-job" => 'candidatures#new', as: :new_candidature
  post "/ok-ik-wil-een-job" => 'candidatures#create', as: :candidatures

  get "/sollicitatie-ontvangen" => 'candidatures#received', as: :received_candidatures

  get "/404" => 'errors#error_404'
  get "/500" => 'errors#error_500'

  root to: redirect('/start')
end
