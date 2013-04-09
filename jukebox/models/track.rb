require 'soundcloud'
# require 'pry'

class Track < ActiveRecord::Base

  def self.search_tracks(search)
  client = Soundcloud.new(:client_id => '1b140141f63f1ef02fd6722579f46745')
  @tracks = client.get('/tracks', :q => search)
  end

  def self.play_track
  @sound_cloud_widget = client.get('/oembed', :url => @track.player_url)['html']
  end
end
