class FiguresController < ApplicationController

   #INDEX
  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end 

  #NEW
  get '/figures/new' do
    erb :'figures/new'
  end 

  #CREATE
  post '/figures' do
    Figure.create(params[:figures])
    redirect to '/figures'
  end 

  #EDIT FORM 
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  #UPDATE
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figures])
    
    redirect "/figures/#{params[:id]}"
  end

  #SHOW
  get '/figures/:id' do 
    # binding.pry
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end 

  #DESTROY!!:<
  delete '/figures/:id' do
    @figure = Figure.find(params[:id]).destroy 
    redirect "/figures"
  end


end 