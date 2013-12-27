require 'rubygems'
require 'httparty'
require 'twilio-ruby'
require 'sinatra'

get '/' do
	response = HTTParty.get('http://api.icndb.com/jokes/random')
	twiml = Twilio::TwiML::Response.new do |r|
		r.Message  response['value']['joke']
	end
	twiml.text
end
