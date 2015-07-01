class TitlesController < ApplicationController

 #INDEX
  get '/titles' do 
    @titles = Title.all 
    erb :'titles/index'
  end 

  #NEW
  get '/titles/new' do
    erb :'titles/new'
  end 

  #CREATE
  post '/titles' do
    Title.create(params[:titles])
    redirect to '/titles'
  end 

  #EDIT FORM 
  get '/titles/:id/edit' do
    @title = Title.find(params[:id])
    erb :'titles/edit'
  end

  #UPDATE
  patch '/titles/:id' do
    @title = Title.find(params[:id])
    @title.update(params[:titles])
    
    redirect "/titles/#{params[:id]}"
  end

  #SHOW
  get '/titles/:id' do 
    @title = Title.find(params[:id])
    erb :'titles/show'
  end 

  #DESTROY!!:<
  delete '/titles/:id' do
    @title = Title.find(params[:id]).destroy 
    redirect "/titles"
  end

end