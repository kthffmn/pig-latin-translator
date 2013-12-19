#####################################
### P I G    L A T I N   S P E C  ###
#####################################

require './pig_latin'

RSpec.configure do |config|
	config.color_enabled = true
	config.tty = true
	config.formatter = :progress
end

describe PigLatin, "#initialize" do
	it "should be able to initialize PigLatin" do
    	lambda {PigLatin.new("banana")}.should_not raise_error
 	end
end

describe PigLatin, "#parse_string" do
	it "should return an array" do
		piglatin = PigLatin.new("banana nut squash")
		expect(piglatin.parse_string).to eq(["banana", "nut", "squash"])
	end
	it "should " do
		piglatin = PigLatin.new("shut that quiet mouth")
		expect(piglatin.parse_string).to eq(["shut", "that", "quiet", "mouth"])
	end
end

describe PigLatin, "#apply_rules" do
	it "should return an array with modified strings" do
		piglatin = PigLatin.new("banana nut squash")
		expect(piglatin.apply_rules).to eq(["ananabay", "utnay", "quashsay"])
	end
	it "should not raise error when a word with only one letter is entered" do
		piglatin = PigLatin.new("i am a very important secret")
		expect(piglatin.apply_rules).to eq(["iay", "maay", "aay", "eryvay", "mportantiay", "ecretsay"])
	end
	it "should put 'sh' and 'th' and 'qu' at the end to maintain sound" do
		piglatin = PigLatin.new("shut that quiet mouth")
		expect(piglatin.apply_rules).to eq(["utshay", "atthay", "ietquay", "outhmay"])
	end
end

describe PigLatin, "#array_to_string" do
	it "should return a string with modifications" do
		piglatin = PigLatin.new("banana nut squash")
		expect(piglatin.array_to_string).to eq("ananabay utnay quashsay")
	end
end



