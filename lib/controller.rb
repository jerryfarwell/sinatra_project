require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

  post '/gossips/new/' do
  	a = Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
  end

  get 'gossips/:id' do
  	erb :show, locals: {gossip: Gossip.new(params[@author], params[@content]).find(params['id'], i: params['id'])}
	end

end