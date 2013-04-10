require 'soundcloud'
Jukebox::App.controllers :tracks do
  
 
  
  get :play do

  end

  get :index do
  render 'tracks/index'
  end

  # get :search do
  #   render 'tracks/search'
  # end

  post :search do
  @results = Track.search_tracks(params[:searchterm])
  render 'tracks/search'
  end

  # post :player do
  # Track.play_track
  # render 'tracks/player'
  # end

  get :player do
   @sound_cloud_widget = Track.play_track(params[:id])
   render '/tracks/player'
  end

end
