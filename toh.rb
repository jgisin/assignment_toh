class Toh


	def render(board = {one: [1,2,3,4], two: [], three: []})
		board.each do |index, value|
			print "P #{index}:"
			board[index].length.times do |item|
				print value[item]
			end
			puts ''
		end
	end

	def get_position(selection)
		case selection
			when 1
				return :one
			when 2
				return :two
			when 3
				return :three

	end
			
	end

	def move_piece(piece, position, board = {one: [1,2,3,4], two: [], three: []})
		if board[:one].include?(piece)
			board[:one] -= [piece]
			board[position] += [piece]
		elsif board[:two].include?(piece)
			board[:two] -= [piece]
			board[position] += [piece]
		elsif board[:three].include?(piece)
			board[:three] -= [piece]
			board[position] += [piece]
		end
		board
	end

	def game
		board = {one: [1,2,3,4], two: [], three: []}
		render
		while board[:three].length != 4
			puts "Please select which piece to move"
			piece = gets.chomp.to_i
			puts "Please select where to move the piece"
			get_position(selection = gets.chomp.to_i)
			render(move_piece(piece, :three, board))
		end
		puts "Congrats you win!!"
	end

end


	a = Toh.new
	a.game
