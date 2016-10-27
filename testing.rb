classmates = ["Jack", "Wally", "Joey"]
classmates.each do |name|
#	puts "Morning #{name}!"
end

#classmates.each{|name| puts"Morning #{name}"}

cities = ["miami", "madrid", "barcelona"]

#puts cities.map{|city| city.capitalize}

total_length =  cities.reduce(0) do |sum, city|
		sum + city.length
end

puts total_length / cities.length