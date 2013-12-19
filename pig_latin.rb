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
		parse_string.collect do |s|
			if s.length > 1
				if  s[0..1].downcase == "sh"  || 
					s[0..1].downcase == "th"  ||
					s[0..1].downcase == "qu"
					first_letters = s[0..1]
					string = s[2..-1]
					"#{string}#{first_letters}ay"
				elsif   s.downcase == "is" 	    || s.downcase == "sigh"    || 
						s.downcase == "my"      || s.downcase == "by"      ||
						s.downcase == "buy"     || s[0].downcase == "i"    ||
						s[0].downcase == "a"	|| s[0].downcase == "e"    ||
						s[0].downcase == "o"    || s[0].downcase == "u"    || 
						s[0].downcase == "y"
					"#{s}ay"				
				else
					first_letter = s[0]
					string = s[1..-1]
					"#{string}#{first_letter}ay"
				end
			else
				"#{s}ay"
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