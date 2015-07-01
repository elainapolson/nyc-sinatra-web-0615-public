class LandmarksController < ApplicationController

  #INDEX
  get '/landmarks' do 
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end 

  #NEW
  get '/landmarks/new' do
    erb :'landmarks/new'
  end 

  #CREATE
  post '/landmarks' do
    Landmark.create(params[:landmarks])
    redirect to '/landmarks'
    #should we change to show? 
  end 

  #EDIT FORM 
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  #UPDATE
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmarks])
    redirect "/landmarks/#{params[:id]}"
  end

  #SHOWTIMEZ
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end 

  #DESTROY!!:<
  delete '/landmarks/:id' do
    @landmark = Landmark.find(params[:id]).destroy 
    redirect "/landmarks"
  end


end
