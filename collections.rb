class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "Barcelona", 2, 42),
  Home.new("Fernando's place", "London", 5, 47),
  Home.new("Josh's place", "Madrid", 3, 41),
  Home.new("Gonzalo's place", "Madrid", 2, 45),
  Home.new("Super place", "Barcelona", 10, 55),
  Home.new("Sara's place", "London", 4, 65),
  Home.new("Castle", "London", 5, 25),
  Home.new("Cesar's place", "Barcelona", 3, 35),
  Home.new("Pepe's place", "Madrid", 6, 40),
  Home.new("Ariel's place", "Barcelona", 4, 49)
]

def filter_cities
		print "Where do you want to go?\n
			1. Madrid\n
			2. Barcelona\n
			3. London\n"
		city_selected = gets.chomp

		if city_selected == "1"
			madrid_homes = homes.select {|hm| hm.city == "Madrid"}
			madrid_homes.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"}
		elsif city_selected == "2"
			bcn_homes = homes.select {|hm| hm.city == "Barcelona"}
			bcn.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"}
		elsif city_selected == "3"
			london = homes.select {|hm| hm.city == "London"}
			london.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"}
		end
end

def order_by
	print "How you want to order the results?\n
			1. Lowest price first\n
			2. Highest price first\n
			3. Higher Capacity\n
			4. Lower Capacity\n
			5. Select a city"
	order_method = gets.chomp

		if order_method == "1"
			#Ordena casas baratas
			low_price_home = homes.sort do |home1, home2|
				home1.price <=> home2.price
			end
			#Muestra listado casas baratas
			low_price_home.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n"}
		elsif order_method == "2"
			#Muestra listado casas caras
			high_price_home = low_price_home.reverse
			high_price_home.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n"}
		elsif order_method == "3"
			#Listado capacidad
			home_capacity_list = homes.sort do |home1, home2|
				home1.capacity <=> home2.capacity
			end
			home_capacity_list.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n"}
		elsif order_method == "4"
			home_capacity = home_capacity_list.reverse
			home_capacity.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night\n"}
		elsif order_method == "5"

			

		else
			puts "Choose a order by its number\n
				1. Lowest price first\n
				2. Highest price first\n
				3. Higher Capacity\n
				4. Lower Capacity\n"
		end
end
#Muestra listado casas
homes.each {|home| puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"}
print "Do you want to order the results or filter them?"
create_house_list = gets.chomp

if create_house_list == "order"
	homes.order_by
else
	homes.filter_cities
end



cities = homes.map do |hm|
  hm.city
end
puts cities

#prices = homes.map {|hm| hm.price}
#puts prices.inject(0) {|sum, i| sum + i} / prices.length

total_capacities = homes.reduce(0.0) do |sum, hm|
  sum + hm.capacity
end

puts total_capacities


high_capacity_homes = homes.select do |hm|
  # Keep hm only if its capacity is 4 or greater
  hm.capacity >= 4
end