###############################
### P I G  L A T I N  A P P ###
###############################

require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/pig_latin.rb'

class App < Sinatra::Application

	get '/' do
		erb :index
	end

	post '/translation' do
		@sentence = params["birthday"]
		piglatin = PigLatin.new(@sentence)
		@message = piglatin.array_to_string
		erb :results
	end

end
