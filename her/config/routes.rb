Rails.application.routes.draw do
  get 'article_form/index'
  get 'article/index'
  resources :request_executions
  get 'request_execution/index'
  get 'request/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'get_article/:id' , to: 'get_article#show'
end
