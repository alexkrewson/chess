class Node
	attr_accessor :up, :upRight, :right, :downRight, :down, :downLeft, :left, :upLeft, :coordinates, :piece, :nodes, :piece_name

	def initialize(coordinates)
	@coordinates = coordinates

	case @coordinates
	when [1,1]
		self.piece_name = "wr1"
		self.piece = "\u265C"
	when [1,2]
		self.piece_name = "wk1"
		self.piece = "\u265E"
	when [1,3]
		self.piece_name = "wb1"
		self.piece = "\u265D"
	when [1,4]
		self.piece_name = "wq "
		self.piece = "\u265B"
	when [1,5]
		self.piece_name = "wk "
		self.piece = "\u265A"
	when [1,6]
		self.piece_name = "wb2"
		self.piece = "\u265D"
	when [1,7]
		self.piece_name = "wk2"
		self.piece = "\u265E"
	when [1,8]
		self.piece_name = "wr2"
		self.piece = "\u265C"
	when [2,1]
		self.piece_name = "wp1"
		self.piece = "\u265F"
	when [2,2]
		self.piece_name = "wp2"
		self.piece = "\u265F"
	when [2,3]
		self.piece_name = "wp3"
		self.piece = "\u265F"
	when [2,4]
		self.piece_name = "wp4"
		self.piece = "\u265F"
	when [2,5]
		self.piece_name = "wp5"
		self.piece = "\u265F"
	when [2,6]
		self.piece_name = "wp6"
		self.piece = "\u265F"
	when [2,7]
		self.piece_name = "wp7"
		self.piece = "\u265F"
	when [2,8]
		self.piece_name = "wp8"
		self.piece = "\u265F"
	when [8,1]
		self.piece_name = "br1"
		self.piece = "\u2656"
	when [8,2]
		self.piece_name = "bk1"
		self.piece = "\u2658"
	when [8,3]
		self.piece_name = "bb1"
		self.piece = "\u2657"
	when [8,4]
		self.piece_name = "bq "
		self.piece = "\u2655"
	when [8,5]
		self.piece_name = "bk "
		self.piece = "\u2654"
	when [8,6]
		self.piece_name = "bb2"
		self.piece = "\u2657"
	when [8,7]
		self.piece_name = "bk2"
		self.piece = "\u2658"
	when [8,8]
		self.piece_name = "br2"
		self.piece = "\u2656"
	when [7,1]
		self.piece_name = "bp1"
		self.piece = "\u2659"
	when [7,2]
		self.piece_name = "bp2"
		self.piece = "\u2659"
	when [7,3]
		self.piece_name = "bp3"
		self.piece = "\u2659"
	when [7,4]
		self.piece_name = "bp4"
		self.piece = "\u2659"
	when [7,5]
		self.piece_name = "bp5"
		self.piece = "\u2659"
	when [7,6]
		self.piece_name = "bp6"
		self.piece = "\u2659"
	when [7,7]
		self.piece_name = "bp7"
		self.piece = "\u2659"
	when [7,8]
		self.piece_name = "bp8"
		self.piece = "\u2659"
	else
		self.piece_name = ""
		self.piece = "  "
	end	

	@@nodes.push(self)
	end

	def self.make_nodes

		@@nodes ||= []
		i = 1
		j = 1
		while i < 9
			while j < 9
				node = Node.new([i,j])
				j += 1
			end # while j < 9
			j = 1
			i += 1
		end # while i < 9
			@@nodes

			board = @@nodes
			j = 0
			while j < board.length
				node = board[j]
				right_coordinates = [node.coordinates[0],node.coordinates[1]+1]
				left_coordinates = [node.coordinates[0],node.coordinates[1]-1]
				up_coordinates = [node.coordinates[0]+1,node.coordinates[1]]
				down_coordinates = [node.coordinates[0]-1,node.coordinates[1]]

				i = 0
				while i < board.length
					if board[i].coordinates == right_coordinates
						node.right = board[i]
						# puts "node.right.coordinates: #{node.right.coordinates}"
					end
				i += 1
				end # i < board.length

				i = 0
				while i < board.length
					if board[i].coordinates == left_coordinates
						node.left = board[i]
						# puts "node.left.coordinates: #{node.left.coordinates}"
					end
				i += 1
				end # i < board.length

				i = 0
				while i < board.length
					if board[i].coordinates == up_coordinates
						node.up = board[i]
						# puts "node.up.coordinates: #{node.up.coordinates}"
					end
				i += 1
				end # i < board.length

				i = 0
				while i < board.length
					if board[i].coordinates == down_coordinates
					node.down = board[i]
					# puts "node.up.coordinates: #{node.up.coordinates}"
					end
				i += 1
				end # i < board.length
		j += 1
		end # j < board.length
		board
	end # self.make_nodes
end # class Node


class Game

	def initialize
		@board = Node.make_nodes
		@turn = 1
		@pawn_list = ["wp1","wp2","wp3","wp4","wp5","wp6","wp7","wp8","bp1","bp2","bp3","bp4","bp5","bp6","bp7","bp8"]
		@rook_list = ["wr1","wr2","br1","br2"]
		@knight_list = ["wk1","wk2","bk1","bk2"]
		@bishop_list = ["wb1","wb2","bb1","bb2"]
		@king_list = ["wk ","bk "]
		@queen_list = ["wq ","bq "]
		@white_list = ["wp1","wp2","wp3","wp4","wp5","wp6","wp7","wp8","wr1","wr2","wk1","wk2","wb1","wb2","wk","wq"]
		@black_list = ["bp1","bp2","bp3","bp4","bp5","bp6","bp7","bp8","br1","br2","bk1","bk2","bb1","bb2","bk","bq"]
	end

	def play
		while @turn < 5 # !@finished
			show_board
			# move("@white_rook2","up",7)
			move_prompt
			show_board
			@turn += 1
		end
	end

	def move_prompt
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		@this_move_piece_name = "nothing"
		@this_move_direction = ""
		@this_move_distance = 9000
		while !valid_move?(@this_move_piece_name,@this_move_direction,@this_move_distance)
			puts ""
			puts "Player #{player}, which piece would you like to move?"
			puts ""
			@this_move_piece_name = gets.chomp
			puts ""
			puts "Player #{player}, in which direction would you like to move #{@this_move_piece_name}?"
			puts ""
			@this_move_direction = gets.chomp
			puts ""
			puts "Player #{player}, how far would you like to travel #{@this_move_direction}?"
			puts ""
			@this_move_distance = gets.chomp.to_i
			puts "@this_move_piece_name: #{@this_move_piece_name}"
			puts "@this_move_direction: #{@this_move_direction}"
			puts "@this_move_distance: #{@this_move_distance}"
		end
		move(@this_move_piece_name,@this_move_direction,@this_move_distance)
	end

	def valid_move?(piece_name,direction,distance)
		# puts "current coordinates: #{node_of(piece_name).coordinates}"
		# puts "piece_name: #{piece_name}"
		# puts "distance (in valid_move?): #{distance}"
		# # puts "current coordinates[0] - distance: #{node_of(piece_name).coordinates[0] - distance}"
		# puts "node_of(piece_name).up.piece_name: #{node_of(piece_name).up.piece}"
		# puts "node_of(piece_name).up.piece_name == "": #{node_of(piece_name).up.piece_name == ""}"
		if piece_name != "nothing"
			@all_clear |= all_clear?(piece_name,direction,distance)
		end
		if @pawn_list.include?(piece_name)
			if @white_list.include?(piece_name)
				if direction == "u" && (node_of(piece_name).coordinates[0] + distance) < 9 && @all_clear
					return true
				else
					puts "INVALID MOVE"
					return false
				end
			elsif @black_list.include?(piece_name)
				if direction == "d" && (node_of(piece_name).coordinates[0] - distance) > 0 && @all_clear
					return true
				else 
					puts "INVALID MOVE"
					# puts "current coordinates[1]: #{node_of(piece_name).coordinates[1]}"
					# puts "current coordinates[1] - distance: #{node_of(piece_name).coordinates[1] - distance}"
					return false													
				end
			else
				puts "INVALID MOVE"
				return false	
			end
		elsif @rook_list.include?(piece_name)
			if @white_list.include?(piece_name)
				if direction == "u" || direction == "r" || direction == "d" || direction == "l"
					return true
				else
					puts "INVALID MOVE"
					return false
				end
			elsif @black_list.include?(piece_name)
				if direction == "u" || direction == "r" || direction == "d" || direction == "l"
					return true
				else 
					puts "INVALID MOVE"
					return false													
				end
			else
				puts "INVALID MOVE"
				return false	
			end
		# elsif @bishop_list.include?(piece_name)
		# 	if @white_list.include?(piece_name)
		# 		if direction == "ul" || direction == "ur" || direction == "dl" || direction == "lr"
		# 			return true
		# 		else
		# 			puts "INVALID MOVE"
		# 			return false
		# 		end
		# 	elsif @black_list.include?(piece_name)
		# 		if direction == "ul" || direction == "ur" || direction == "dl" || direction == "lr"
		# 			return true
		# 		else 
		# 			puts "INVALID MOVE"
		# 			return false													
		# 		end
		# 	else
		# 		puts "INVALID MOVE"
		# 		return false	
		# 	end
		# elsif @rook_list.include?(piece_name)
		# 	if @white_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else
		# 			puts "INVALID MOVE"
		# 			return false
		# 		end
		# 	elsif @black_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else 
		# 			puts "INVALID MOVE"
		# 			return false													
		# 		end
		# 	else
		# 		puts "INVALID MOVE"
		# 		return false	
		# 	end
		# elsif @rook_list.include?(piece_name)
		# 	if @white_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else
		# 			puts "INVALID MOVE"
		# 			return false
		# 		end
		# 	elsif @black_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else 
		# 			puts "INVALID MOVE"
		# 			return false													
		# 		end
		# 	else
		# 		puts "INVALID MOVE"
		# 		return false	
		# 	end
		# elsif @rook_list.include?(piece_name)
		# 	if @white_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else
		# 			puts "INVALID MOVE"
		# 			return false
		# 		end
		# 	elsif @black_list.include?(piece_name)
		# 		if direction == "u" || direction == "r" || direction == "d" || direction == "l"
		# 			return true
		# 		else 
		# 			puts "INVALID MOVE"
		# 			return false													
		# 		end
		# 	else
		# 		puts "INVALID MOVE"
		# 		return false	
		# 	end
		
		end
	end

	def all_clear?(piece_name,direction,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			puts "current_node: #{current_node}"
			puts "current_node.coordinates: #{current_node.coordinates}"
			puts "current_node.piece_name: #{current_node.piece_name}"
			if direction == "u"
				current_node = current_node.up
			end
			if direction == "d"
				current_node = current_node.down
			end
			if current_node.piece_name != ""
				show_board
				return false
			end
			spots += 1
		end
		return true
	end

	def move(piece_name,direction,distance)
		# puts "piece_name: #{piece_name}"
		# puts "direction: #{direction}"
		# puts "distance: #{distance}"

		if direction == "u"
			move_up(piece_name,distance)
		elsif direction == "r"
			move_right(piece_name,distance)
		elsif direction == "d"
			move_down(piece_name,distance)
		elsif direction == "l"
			move_left(piece_name,distance)
		end
			

		# elsif piece_name.include?("king") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("queen") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	if direction == "up"
		# 		move_up(piece_name,distance)
		# 	elsif direction == "right"
		# 		move_right(piece_name,distance)
		# 	elsif direction == "donw"
		# 		move_down(piece_name,distance)
		# 	elsif direction == "left"
		# 		move_left(piece_name,distance)
		# 	else
		# 		puts "woops"
		# 	end
		# elsif piece_name.include?("bishop") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("knight") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("pawn") && piece_name.include?("white")
			# move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# elsif piece_name.include?("rook") && piece_name.include?("white")
		# 	move_up(piece_name,distance)
		# else
		# 	return "woops"
		# end # long else if for piece categorizing


	end # move(piece,destination)

	def move_up(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			current_node.up.piece_name = piece_name
			current_node.up.piece = current_node.piece
			current_node.piece_name = ""
			current_node.piece = " "
			current_node = current_node.up
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_right(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			current_node.right.piece_name = piece_name
			current_node.right.piece = current_node.piece
			current_node.piece_name = ""
			current_node.piece = " "
			current_node = current_node.right
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_down(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			current_node.down.piece_name = piece_name
			current_node.down.piece = current_node.piece
			current_node.piece_name = ""
			current_node.piece = " "
			current_node = current_node.down
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_left(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			current_node.left.piece_name = piece_name
			current_node.left.piece = current_node.piece
			current_node.piece_name = ""
			current_node.piece = " "
			current_node = current_node.left
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def node_of(piece_name)
		i = 0
		while i < @board.length
			if @board[i].piece_name == piece_name
				return @board[i]
			end # if @board[i].coordinates == coordinates
		i += 1
		end # while i < @board.length
	end # node_of(piece)

	def node_at(coordinates)
		i = 0
		while i < @board.length
			# puts "@board[i].coordinates: #{@board[i].coordinates}"
			if @board[i].coordinates == coordinates
				return @board[i]
			end # if @board[i].coordinates == coordinates
			i += 1
		end # while i < @board.length
	end # node_at(coordinates)

	def show_board
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([8,1]).piece.encode('utf-8')}#{node_at([8,1]).piece_name[-1]} | #{node_at([8,2]).piece.encode('utf-8')}#{node_at([8,2]).piece_name[-1]} | #{node_at([8,3]).piece.encode('utf-8')}#{node_at([8,3]).piece_name[-1]} | #{node_at([8,4]).piece.encode('utf-8')}#{node_at([8,4]).piece_name[-1]} | #{node_at([8,5]).piece.encode('utf-8')}#{node_at([8,5]).piece_name[-1]} | #{node_at([8,6]).piece.encode('utf-8')}#{node_at([8,6]).piece_name[-1]} | #{node_at([8,7]).piece.encode('utf-8')}#{node_at([8,7]).piece_name[-1]} | #{node_at([8,8]).piece.encode('utf-8')}#{node_at([8,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([7,1]).piece.encode('utf-8')}#{node_at([7,1]).piece_name[-1]} | #{node_at([7,2]).piece.encode('utf-8')}#{node_at([7,2]).piece_name[-1]} | #{node_at([7,3]).piece.encode('utf-8')}#{node_at([7,3]).piece_name[-1]} | #{node_at([7,4]).piece.encode('utf-8')}#{node_at([7,4]).piece_name[-1]} | #{node_at([7,5]).piece.encode('utf-8')}#{node_at([7,5]).piece_name[-1]} | #{node_at([7,6]).piece.encode('utf-8')}#{node_at([7,6]).piece_name[-1]} | #{node_at([7,7]).piece.encode('utf-8')}#{node_at([7,7]).piece_name[-1]} | #{node_at([7,8]).piece.encode('utf-8')}#{node_at([7,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([6,1]).piece.encode('utf-8')}#{node_at([6,1]).piece_name[-1]} | #{node_at([6,2]).piece.encode('utf-8')}#{node_at([6,2]).piece_name[-1]} | #{node_at([6,3]).piece.encode('utf-8')}#{node_at([6,3]).piece_name[-1]} | #{node_at([6,4]).piece.encode('utf-8')}#{node_at([6,4]).piece_name[-1]} | #{node_at([6,5]).piece.encode('utf-8')}#{node_at([6,5]).piece_name[-1]} | #{node_at([6,6]).piece.encode('utf-8')}#{node_at([6,6]).piece_name[-1]} | #{node_at([6,7]).piece.encode('utf-8')}#{node_at([6,7]).piece_name[-1]} | #{node_at([6,8]).piece.encode('utf-8')}#{node_at([6,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([5,1]).piece.encode('utf-8')}#{node_at([5,1]).piece_name[-1]} | #{node_at([5,2]).piece.encode('utf-8')}#{node_at([5,2]).piece_name[-1]} | #{node_at([5,3]).piece.encode('utf-8')}#{node_at([5,3]).piece_name[-1]} | #{node_at([5,4]).piece.encode('utf-8')}#{node_at([5,4]).piece_name[-1]} | #{node_at([5,5]).piece.encode('utf-8')}#{node_at([5,5]).piece_name[-1]} | #{node_at([5,6]).piece.encode('utf-8')}#{node_at([5,6]).piece_name[-1]} | #{node_at([5,7]).piece.encode('utf-8')}#{node_at([5,7]).piece_name[-1]} | #{node_at([5,8]).piece.encode('utf-8')}#{node_at([5,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([4,1]).piece.encode('utf-8')}#{node_at([4,1]).piece_name[-1]} | #{node_at([4,2]).piece.encode('utf-8')}#{node_at([4,2]).piece_name[-1]} | #{node_at([4,3]).piece.encode('utf-8')}#{node_at([4,3]).piece_name[-1]} | #{node_at([4,4]).piece.encode('utf-8')}#{node_at([4,4]).piece_name[-1]} | #{node_at([4,5]).piece.encode('utf-8')}#{node_at([4,5]).piece_name[-1]} | #{node_at([4,6]).piece.encode('utf-8')}#{node_at([4,6]).piece_name[-1]} | #{node_at([4,7]).piece.encode('utf-8')}#{node_at([4,7]).piece_name[-1]} | #{node_at([4,8]).piece.encode('utf-8')}#{node_at([4,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([3,1]).piece.encode('utf-8')}#{node_at([3,1]).piece_name[-1]} | #{node_at([3,2]).piece.encode('utf-8')}#{node_at([3,2]).piece_name[-1]} | #{node_at([3,3]).piece.encode('utf-8')}#{node_at([3,3]).piece_name[-1]} | #{node_at([3,4]).piece.encode('utf-8')}#{node_at([3,4]).piece_name[-1]} | #{node_at([3,5]).piece.encode('utf-8')}#{node_at([3,5]).piece_name[-1]} | #{node_at([3,6]).piece.encode('utf-8')}#{node_at([3,6]).piece_name[-1]} | #{node_at([3,7]).piece.encode('utf-8')}#{node_at([3,7]).piece_name[-1]} | #{node_at([3,8]).piece.encode('utf-8')}#{node_at([3,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([2,1]).piece.encode('utf-8')}#{node_at([2,1]).piece_name[-1]} | #{node_at([2,2]).piece.encode('utf-8')}#{node_at([2,2]).piece_name[-1]} | #{node_at([2,3]).piece.encode('utf-8')}#{node_at([2,3]).piece_name[-1]} | #{node_at([2,4]).piece.encode('utf-8')}#{node_at([2,4]).piece_name[-1]} | #{node_at([2,5]).piece.encode('utf-8')}#{node_at([2,5]).piece_name[-1]} | #{node_at([2,6]).piece.encode('utf-8')}#{node_at([2,6]).piece_name[-1]} | #{node_at([2,7]).piece.encode('utf-8')}#{node_at([2,7]).piece_name[-1]} | #{node_at([2,8]).piece.encode('utf-8')}#{node_at([2,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	puts "| #{node_at([1,1]).piece.encode('utf-8')}#{node_at([1,1]).piece_name[-1]} | #{node_at([1,2]).piece.encode('utf-8')}#{node_at([1,2]).piece_name[-1]} | #{node_at([1,3]).piece.encode('utf-8')}#{node_at([1,3]).piece_name[-1]} | #{node_at([1,4]).piece.encode('utf-8')}#{node_at([1,4]).piece_name[-1]} | #{node_at([1,5]).piece.encode('utf-8')}#{node_at([1,5]).piece_name[-1]} | #{node_at([1,6]).piece.encode('utf-8')}#{node_at([1,6]).piece_name[-1]} | #{node_at([1,7]).piece.encode('utf-8')}#{node_at([1,7]).piece_name[-1]} | #{node_at([1,8]).piece.encode('utf-8')}#{node_at([1,8]).piece_name[-1]} |"
	puts "_________________________________________"
	puts ""
	end # show_board
end #class Game

game = Game.new
game.play

# make valid move rules for each piece

	# add collision detection

	# add check to see if piece is still alive

# make all directions for all pieces

# attack

# check for checkmate and stalemate

# make it saveable

















