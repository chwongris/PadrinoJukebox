require 'soundcloud'
Jukebox::App.controllers :tracks do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
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
# binding.pry
  render 'tracks/search'
  end

  # post :player do
  # Track.play_track
  # render 'tracks/player'
  # end

  get :player do
  # binding.pry
  # Track.play_track(params[:id])
    client = Soundcloud.new(:client_id => '1b140141f63f1ef02fd6722579f46745')
  @sound_cloud_widget = client.get('/oembed', :url => params[:id])['html']
   render '/tracks/player'
  end

end
