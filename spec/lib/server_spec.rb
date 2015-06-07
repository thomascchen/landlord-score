require 'rspec'
require 'rack/test'
require_relative '../../lib/server'

describe 'Landlord Score App' do
  include Rack::Test::Methods

  def app
    LandlordScoreApp.new
  end

  describe 'Index Redirect' do
    it "Homepage should redirect to locations#index" do
      get "/"
      expect(last_response).to be_redirect
      expect(last_response.location).to include '/index'
    end
  end

  describe 'Landing Page' do
    it "should respond to /" do
      get '/index'
      expect(last_response.body).to include 'Search Landlords'
    end

    # it "should include a search form" do
    #   get '/index'
    #   expect(last_response).to include
    # end
  end

end
