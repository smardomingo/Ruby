#require 'matrix'

#table = matrix[
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#			[0, 0, 0, 0, 0, 0, 0],
#		]

require 'pry'
class Piece
	def initialize(origin, destination)
		get_coordenadas(origin, destination)
	end

	def get_coordenadas(origin, destination)
		@origin_column = origin.split(",")[0].to_i
		@origin_row = origin.split(",")[1].to_i
		@final_column = destination.split(",")[0].to_i
		@final_row = destination.split(",")[1].to_i
	end

	def check_line_move
		if @origin_column == @final_column
			return true
		elsif @origin_row == @final_row
			return true
		else
			return false
		end		
	end

	def check_diagonal_move
		if @origin_column - @final_column == @origin_row - @final_row
			return true
		else
			return false
		end
		
	end
end

class Rook < Piece
	def check_move
		if check_line_move == true
			puts "LEGAL"
		else
			puts "ILLEGAL"
		end
	end
end

class Bishop < Piece
	def check_move
		if check_diagonal_move == true
			puts "LEGAL"
		else
			puts "ILLEGAL"			
		end
	end
end

class Queen < Piece
	def check_move
		if check_line_move == true
			puts "LEGAL"
		elsif check_diagonal_move == true
			puts "LEGAL"
		else
			puts "ILLEGAL"			
		end			
	end
end

class King < Piece
	def check_move
		col_difference = (@origin_column - @final_column).abs
		row_difference = (@origin_row - @final_row).abs
		difference = col_difference + row_difference
		if  difference == 0 || 1
			puts "LEGAL"
		else
			puts "ILLEGAL"
		end		
	end
end

rook1 = Rook.new("0,3","0,2")
rook2 = Rook.new("1,1", "0,2")
bishop1 = Bishop.new("1,1","2,2")
bishop2 = Bishop.new("0,3","0,2")
queen1 = Queen.new("0,3","0,2")
queen2 = Queen.new("1,3","0,2")
queen3 = Queen.new("1,6","0,2")
king1 = King.new("1,1", "0,1")
king2 = King.new("1,1", "2,2")
king3 = King.new("1,1", "1,0")
king4 = King.new("1,1", "1,3")
puts "Rook moves"
rook1.check_move
rook2.check_move
puts "Bishop moves"
bishop1.check_move
bishop2.check_move
puts "Queen moves"
queen1.check_move
queen2.check_move
queen3.check_move
puts "King moves"
king1.check_move
king2.check_move
king3.check_move
king4.check_move
