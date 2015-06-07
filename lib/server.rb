require 'sinatra'
require 'pg'

require 'sinatra/base'

class LandlordScoreApp < Sinatra::Base

  def db_connection
    begin
      connection = PG.connect(dbname: "landlordscore")
      yield(connection)
    ensure
      connection.close
    end
  end

  get '/' do
    redirect '/index'
  end

  get '/index' do
    erb :index
  end

  get '/search' do
    results = db_connection do |conn|
      conn.exec("") #SELECT landlord info WHERE name ILIKE params[:search] OR address ILIKE params[:search]
    end

    erb :search, locals: { results: results.to_a }
  end

  get '/review' do

    erb :review
  end

  post '/review' do

    redirect '/landlord/params[:id]'
  end

  get '/landlord/:id' do

    erb :landlord
  end

end
