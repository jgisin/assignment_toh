	class Toh


		def render(board = {one: [1,2,3,4], two: [], three: []})
			#Renders game board
		puts "***************************"
			board.each do |index, value|
				print "P #{index}:"
				board[index].length.times do |item|
					print value[item]
				end
				puts ''
			end
		puts "***************************"
			board
		end

		def get_position(selection)
			#Returns hash index with target position
			case selection
			when 1
				return :one
			when 2
				return :two
			when 3
				return :three
			end
		end

		def find_piece(piece, board)
			#Returns the hash index containing current piece
			if board[:one].include?(piece)
				return :one
			elsif board[:two].include?(piece)
				return :two
			else
				return :three
			end
		end

		def move_piece(piece, position, board = {one: [1,2,3,4], two: [], three: []})
			#Action for moving piece from one has index to another
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

		def main_menu
			puts "Main Menu:"
			puts "1. Instructions"
			puts "2. Play Game"
			puts "3. Quit"
			option = gets.chomp.to_i
			case option
			when 1
				puts "The goal is to move your pieces form Position 1 to Position 4."
				puts "You can only move the smallest piece in each stack."
				puts "Also, you can only move a piece onto either an emtpy space or"
				puts "onto a larger piece. You can't put a big piece on top of a smaller"
				puts "piece."
				puts "You can select 0 at any time to return to the main menu."
				puts "Good Luck!"
				return true
			when 2
				return false
			when 3
				#Ends process to quit
				Kernel.exit(false)
			end
		end



		def logic(board)
			#Defines game logic and rules
			puts "Please select which piece to move"
			piece = gets.chomp.to_i
			if piece == 0
				game
			elsif piece < 5
				puts "Please select where to move the piece"
				selection = gets.chomp.to_i
				if selection == 0
					game
				elsif (selection > 3 || selection < 1)
					puts "***** Please select again. The position must be from 1-3 *****"
					render(board)
				else
					if piece == board[find_piece(piece, board)].sort.first
						if (board[get_position(selection)].sort.first == nil || 
							piece < board[get_position(selection)].sort.first )
						render(move_piece(piece, get_position(selection), board))
					else
						puts "***** Cant move larger piece onto smaller piece *****"
						render(board)

					end
				else
					puts "***** Can only move top piece *****"
					render(board)
				end
			end
		else
			puts "***** Please select again. The piece must be from 1-4 *****"
			render(board)

		end
		board
	end


	def game
		#Intitalizing Game Board
			board = {one: [1,2,3,4], two: [], three: []}
		puts "*****   Welcome to Tower of Hanoi   *****"
			while main_menu			
			end
				render(board)
				while board[:three].length != 4
					logic(board)
					board = logic(board)
				end
				puts "You Win"
				Kernel.exit(false)

		puts "The End"	
	end

end

#Object for game test
a = Toh.new
a.game
