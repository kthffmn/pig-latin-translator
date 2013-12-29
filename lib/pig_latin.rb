#################
### PIG LATIN ###
#################
class PigLatin
	attr_reader :string, :punctuation

	def initialize(string)
		@string = string[0..-2] # removes punctuation
		@punctuation = string[-1]  # gets punctuation
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
		parse_string.collect do |word|
			if word.length > 1 && 	word.count("a") != 0 ||
									word.count("e") != 0 ||
									word.count("i") != 0 ||
									word.count("o") != 0 ||
									word.count("u") != 0 ||
									word.count("y") != 0
				counter = 0
				while 	word[counter] != "a" && word[counter] != "e" &&  
						word[counter] != "i" && word[counter] != "o" && 
						word[counter] != "u" && word[counter] != "y"
					word.insert(-1, "#{word[counter]}")
					word.slice!(0)
				end
				"#{word}ay"	
			else
				"#{word}ay"
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
		pig_latin = container.join(" ")
		pig_latin.insert(-1, punctuation)
	end
end