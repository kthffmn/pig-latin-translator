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
    @sentence = params["sentence"]
		piglatin = PigLatin.new(@sentence)
		@message = piglatin.array_to_string

    @initial_ids = @sentence.split("").zip(piglatin.initial_ids)
    if piglatin.punctuation != ""
      @initial_ids[-1][1] = -1 
    end

    @result_ids = @message.split("").zip(piglatin.result_ids) # [101, 102, 103, 104, 100]
    if piglatin.punctuation != ""
      @result_ids[-1][1] = -1 
    end

		erb :results
	end

end
