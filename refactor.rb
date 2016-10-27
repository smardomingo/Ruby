class IntroducedText
	def get_text
		puts "Introduce your text"
		@text = gets.chomp
		choose_available_operations
	end

	def choose_available_operations
		puts "What do you want to do?"
		puts "1. Count words\n2. Uppercase\n3. Count letters"
		@operation = gets.chomp
		apply_operation
	end

	def apply_operation
		if @operation == "1"
			@text.count_words
		elsif @operation == "2"
			@text.uppercase
		else
			puts "Choose what you want to do"
			choose_available_operations
		end
	end

	def count_words(text)
		@text.split(" ").length
	end
	def uppercase(text)
		@text.uppercase		
	end
end

usertext = IntroducedText.new.get_text