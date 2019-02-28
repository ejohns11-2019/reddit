Rails.application.routes.draw do
    #controller # action. goes to subs controller and index action
  root 'subs#index'

  get 'subs/index' #get a page controller subs and action index

  resources :subs do #this generates all routes
    resources:topics #the :subs do embeds the routes
    #so for each topic get the sub, puts first route inside of 2nd
  end

  # sub_id 7
  # topic_id 4 just referred to as id 4
  # /subs/7/topic/4 the url
  #goes through the 7th sub, view all of the topics and then the 4th topic


  #the line above does all this:
  #get '/subs', to: 'subs#index'
  #get '/subs/:id', to: 'subs#show'
  #get '/subs/:id', to: 'subs#edit'
    #edit is a form change
  #get '/subs/:id', to: 'subs#update'
    #update is a git request
  #delete '/subs/:id', to: 'subs#destroy'

  #request id 7 looks like this:
  #get "subs/7', to: 'subs#show'

  #if only wnat to generate certain routes
  #resources :subs, only: [:index, :show]
  #resources :subs, except: [:index, :show]

end
