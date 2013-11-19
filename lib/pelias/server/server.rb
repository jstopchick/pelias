require 'sinatra'
require 'pelias'

class Server < Sinatra::Base

  get '/suggest/:query' do
    results = Pelias::Search.suggest(params[:query])
    results['suggestions'][0]['options'].to_json
  end

  get '/demo' do
    File.read('lib/pelias/server/map.html')
  end

end