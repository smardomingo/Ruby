
class Lexiconomitron
	def eat_t(input)
		input.gsub(/t/i,"")
	end

	def shazam(input)
		eat_t(input).reverse.split(" ")
	end

	def oompa_loompa(input)
		array = eat_t(input).split(" ")
		mini_array = array.select do |word|
			word.size < 4
		end		
	end
end

puts Lexiconomitron.new.eat_t("great scott!!")
print Lexiconomitron.new.shazam("Today hi")
print Lexiconomitron.new.oompa_loompa("if you wanna be my lover")