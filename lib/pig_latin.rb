#################
### PIG LATIN ###
#################
class PigLatin
	attr_reader :string, :punctuation
	attr_accessor :result_ids, :initial_ids

	def initialize(string)
		if string[-1] == "." || string[-1] == "!" || string[-1] == "?" 
			@string = string[0..-2] # removes punctuation
			@punctuation = string[-1]  # gets punctuation
		else
			@string = string
			@punctuation = ""
		end
		@result_ids = []
		@initial_ids = []
	end

	def parse_string
		string.split
	end

	def find_capitalization
		cap_words = []
		parse_string.each_with_index do |word, index|
			if word[0] == word[0].upcase
				cap_words << index
			end
		end
		cap_words
	end

	def apply_rules
		word_index = 0
		# hi katie = [100, 101, 200, 201, 202, 203, 204]
		# ihay atiekay = [101, 100, 102, 103, 201, 202, 203, 204, 200, 205, 206]
		parse_string.collect do |word|
			@initial_ids << word_index
			@result_ids << word_index
			word_index += 1
			if word.length > 1 && word[0] != "q" && 
				 (word.count("a") != 0 ||
					word.count("e") != 0 ||
					word.count("i") != 0 ||
					word.count("o") != 0 ||
					word.count("u") != 0 ||
					word.count("y") != 0)
				counter = 0
				word_ids = ((word_index*100)...(word_index*100 + word.length)).to_a # [100, 101]
				@initial_ids += word_ids
				while 	word[counter] != "a" && word[counter] != "e" &&  
								word[counter] != "i" && word[counter] != "o" && 
								word[counter] != "u" && word[counter] != "y"
					word.insert(-1, "#{word[counter]}")
					word.slice!(0)
					word_ids.insert(-1, word_ids[counter])
					word_ids.slice!(0)
				end
				word_ids += [(word_index*100 + word.length), (word_index*100 + word.length + 1)]
				@result_ids += word_ids
				"#{word}ay"
			elsif word[0] != "q"
				word_ids = ((word_index*100)...(word_index*100 + word.length)).to_a # [100, 101]
				@initial_ids += word_ids
				word_ids += [(word_index*100 + word.length), (word_index*100 + word.length + 1)]
				@result_ids += word_ids
				"#{word}ay"
			else
				word_ids = ((word_index*100)...(word_index*100 + word.length)).to_a # [100, 101]
				@initial_ids += word_ids
				word_ids = word_ids[2..-1] + word_ids[0..1] + [(word_index*100 + word.length), (word_index*100 + word.length + 1)]
				@result_ids += word_ids
				"#{word[2..-1]}#{word[0..1]}ay"
			end
		end
	end

	def array_to_string
		container = []
		apply_rules.each_with_index do |word, index|
			find_capitalization.each do |num|
				if num == index
					container << word.capitalize
				end
			end
			container.include?(word.capitalize) ? next : container << word
		end
		@initial_ids.slice!(0)
		@result_ids.slice!(0)
		pig_latin = container.join(" ")
		pig_latin.insert(-1, punctuation)

	end
end