require 'rubygems'
require 'httparty'
require 'twilio-ruby'
require 'sinatra'

get '/text' do
	response = HTTParty.get('http://api.icndb.com/jokes/random')
	twiml = Twilio::TwiML::Response.new do |r|
		r.Message  response['value']['joke']
	end
	twiml.text
end

get '/voice' do
	response = HTTParty.get('http://api.icndb.com/jokes/random')
	twiml = Twilio::TwiML::Response.new do |r|
		r.Say  response['value']['joke']
	end
	twiml.text
end
