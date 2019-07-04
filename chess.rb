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
		self.piece_name = "empty "
		self.piece = " "
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
		@piece_info = []
		# i = 0
		# saved_game = File.open("chess_save.txt")#.split('/n')
		# while i < 64
		# 	# saved_game.readline
		# 	puts "saved_game[i]: #{saved_game[i]}"
		# 	# new_node_info = saved_game[0].split(';')
		# 	# @board[i].piece = 
		# 	# newboard = 
		# 	i += 1
		# end
		

		

# 		puts "@board[0].piece_name: #{@board[0].piece_name}"
# @board[0].piece_name = "empty "
# @board[0].piece = " "
# 		puts "@board[0].piece_name: #{@board[0].piece_name}"
# 		puts "piece_info[30][1].length: #{piece_info[30][1].length}"


		# puts "piece_info[0]: #{piece_info[1][0]}"
		# puts 	"saved_game[0][0]: #{saved_game[2]}"
		# puts 	"saved_game[1]: #{saved_game[1]}"
		# puts 	"saved_game[2]: #{saved_game[2]}"
		@turn = 1
		@pawn_list = ["wp1","wp2","wp3","wp4","wp5","wp6","wp7","wp8","bp1","bp2","bp3","bp4","bp5","bp6","bp7","bp8"]
		@rook_list = ["wr1","wr2","br1","br2"]
		@knight_list = ["wk1","wk2","bk1","bk2"]
		@bishop_list = ["wb1","wb2","bb1","bb2"]
		@king_list = ["wk ","bk "]
		@queen_list = ["wq ","bq "]
		@white_list = ["wp1","wp2","wp3","wp4","wp5","wp6","wp7","wp8","wr1","wr2","wk1","wk2","wb1","wb2","wk ","wq "]
		@black_list = ["bp1","bp2","bp3","bp4","bp5","bp6","bp7","bp8","br1","br2","bk1","bk2","bb1","bb2","bk ","bq "]

		@this_move_piece_name = "nothing"
		@this_move_direction = ""
		@this_move_distance = 0
		@white_mortalities = []
		@black_mortalities = []
		@killed_one = false
		@saving_array = []
		@last_piece_name = ""
		@last_piece = ""
		@done_moving = false
		@spots_traveled = Hash.new
	end

	def play
		while @turn < 50 # !@finished

			if @turn == 1
				File.open("chess_save_knight.txt", "r") do |file|
					file.readlines.each_with_index do |line, idx|
					@piece_info[idx] = line.chomp.split(',')
					end   
				end
				
				puts ""
				puts "Would you like to load a game? (y/n)"
				puts ""
				@load = gets.chomp
				if @load == "y"
					i = 0
					while i < 64
						@board[i].piece = @piece_info[i][0]
						# if piece_info[i][1].length == 7
							# @board[i].piece_name = piece_info[i][1][0..5]
						# else
							@board[i].piece_name = @piece_info[i][1]
						# end
						i += 1
					end
				end
			end


			show_board
			move_prompt
			i = 0
			somefile = File.open("chess_save.txt", "w")
			while i < 64
				# @saving_array[i] = [[@board[i].coordinates],@board[i].piece,@board[i].piece_name]
				# @saving_array[i] = "#{@board[i].piece},#{@board[i].piece_name}"
				somefile.puts "#{@board[i].piece},#{@board[i].piece_name}"
				i += 1
			end
			somefile.close
			@turn += 1

			player = 1 if @turn % 2 != 0
			player = 2 if @turn % 2 == 0
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			puts "player #{player} is in checkmate: #{checkmate?}"
			# puts "check?: #{check?}"
		end
	end

	def move_prompt
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		@mistake = 0
		@done_moving = false
		@spots_traveled[@this_move_piece_name] ||= 0
		
		while @mistake == 0 || !valid_move?(@this_move_piece_name,@this_move_direction,@this_move_distance,player) || check?
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
			@mistake += 1
			@spots_traveled[@this_move_piece_name] ||= 0
			# puts "@this_move_piece_name: #{@this_move_piece_name}"
			# puts "@this_move_direction: #{@this_move_direction}"
			# puts "@this_move_distance: #{@this_move_distance}"
		end
		# puts "check: #{check?(@this_move_piece_name,@this_move_direction,@this_move_distance)}"
		move(@this_move_piece_name,@this_move_direction,@this_move_distance)
		@done_moving = true
		@spots_traveled[@this_move_piece_name] += @this_move_distance
		puts "@spots_traveled[@this_move_piece_name]: #{@spots_traveled[@this_move_piece_name]}"
	end
	
	def checkmate?
		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0
		old_piece_name = ""
		old_piece = ""
		original_item_piece_name = ""
		original_item_piece = ""
		killed = false
		
		if player == 1
			king = "wk "
			enemies = @black_list
			friends = @white_list
		else
			king = "bk "
			enemies = @white_list
			friends = @black_list
		end
		
		
		if !check?
			return false
		else
			found = false
			# current_node = node_of("wr1")
			@board.each do |item|
				if (player == 1 && @white_list.include?(item.piece_name)) || (player == 2 && @black_list.include?(item.piece_name))
					current_node = item
					@spots_traveled[item.piece_name] ||= 0
					original_item_piece_name = item.piece_name
					original_item_piece = item.piece
					# move that piece in all possible ways

					if @pawn_list.include?(item.piece_name) && @white_list.include?(item.piece_name)
						
						if !current_node.up.nil? && current_node.up.piece_name == "empty "
							old_node = current_node
							current_node = current_node.up # move up one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item
						i = 0
						puts "@spots_traveled[item.piece_name]: #{@spots_traveled[item.piece_name]}"
						if @spots_traveled[item.piece_name] == 0
							while i < 2
								
								if !current_node.up.nil? && current_node.up.piece_name == "empty "
									puts "in while checkmate pawn loop... current_node.piece_name: #{current_node.piece_name}"
									puts "in while checkmate pawn loop... current_node.coordinates: #{current_node.coordinates}"
									old_node = current_node
									current_node = current_node.up # move up one
									old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
									old_node.piece = " " # resets previous node's piece to " "
									# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
									# 	killed = true
									# end
									old_piece_name = current_node.piece_name # save the old piece_name
									old_piece = current_node.piece # save the old piece
									current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
									if !check? # if this piece being here creates or fails to block a check
										current_node.piece_name = old_piece_name # reset the current node's piece name
										current_node.piece = old_piece # recet the current node's piece
										item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
										item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
										return false
									end
									item.piece_name = original_item_piece_name
									item.piece = original_item_piece
									current_node.piece_name = old_piece_name
									current_node.piece = old_piece
								end
								i += 1
							end
							current_node = item
						end # if !current_node.up.nil? && current_node.up.piece_name == "empty "

						if !current_node.up.nil? && !current_node.up.left.nil? && enemies.include?(current_node.up.left.piece_name)
							old_node = current_node
							puts "in while checkmate pawn up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.up.left
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end

						if !current_node.up.nil? && !current_node.up.right.nil? && enemies.include?(current_node.up.right.piece_name)
							old_node = current_node
							puts "in while checkmate pawn up right loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.up.right
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end
						
					end # if white pawn

					if @pawn_list.include?(item.piece_name) && @black_list.include?(item.piece_name)
						
						if !current_node.down.nil? && current_node.down.piece_name == "empty "
							old_node = current_node
							current_node = current_node.down # move down one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item
						i = 0
						puts "@spots_traveled[item.piece_name]: #{@spots_traveled[item.piece_name]}"
						if @spots_traveled[item.piece_name] == 0
							while i < 2
								
								if !current_node.down.nil? && current_node.down.piece_name == "empty "
									puts "in while checkmate pawn loop... current_node.piece_name: #{current_node.piece_name}"
									puts "in while checkmate pawn loop... current_node.coordinates: #{current_node.coordinates}"
									old_node = current_node
									current_node = current_node.down # move down one
									old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
									old_node.piece = " " # resets previous node's piece to " "
									# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
									# 	killed = true
									# end
									old_piece_name = current_node.piece_name # save the old piece_name
									old_piece = current_node.piece # save the old piece
									current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
									if !check? # if this piece being here creates or fails to block a check
										current_node.piece_name = old_piece_name # reset the current node's piece name
										current_node.piece = old_piece # recet the current node's piece
										item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
										item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
										return false
									end
									item.piece_name = original_item_piece_name
									item.piece = original_item_piece
									current_node.piece_name = old_piece_name
									current_node.piece = old_piece
								end
								i += 1
							end
							current_node = item
						end # if !current_node.down.nil? && current_node.down.piece_name == "empty "

						if !current_node.down.nil? && !current_node.down.left.nil? && enemies.include?(current_node.down.left.piece_name)
							old_node = current_node
							puts "in while checkmate pawn down left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.down.left
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end				
						current_node = item


						if !current_node.down.nil? && !current_node.down.right.nil? && enemies.include?(current_node.down.right.piece_name)
							old_node = current_node
							puts "in while checkmate pawn down right loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.down.right
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end
						current_node = item

					end # if black pawn


					if @knight_list.include?(item.piece_name)
						if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.left.nil? && enemies.include?(current_node.up.up.left.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.up.up.left
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 
						current_node = item
						if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.right.nil? && enemies.include?(current_node.up.up.right.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.up.up.right
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 
						current_node = item
						if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.up.nil? && enemies.include?(current_node.left.left.up.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.left.left.up
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 
						current_node = item
						if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.down.nil? && enemies.include?(current_node.left.left.down.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.left.left.down
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 
						current_node = item
						if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.left.nil? && enemies.include?(current_node.down.down.left.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.down.down.left
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 
						current_node = item
						if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.right.nil? && enemies.include?(current_node.down.down.right.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.down.down.right
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 

						current_node = item
						if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.down.nil? && enemies.include?(current_node.right.right.down.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.right.right.down
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 

						current_node = item
						if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.up.nil? && enemies.include?(current_node.right.right.up.piece_name)
							old_node = current_node
							puts "in while checkmate knight up up left loop... item.coordinates: #{current_node.coordinates}"
							current_node = current_node.right.right.up
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end 

						

					end# end if knight

					if @king_list.include?(item.piece_name)

						if !current_node.up.nil? && current_node.up.piece_name == "empty "
							old_node = current_node
							current_node = current_node.up # move down one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item

						if !current_node.down.nil? && current_node.down.piece_name == "empty "
							old_node = current_node
							current_node = current_node.down # move down one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item

						if !current_node.left.nil? && current_node.left.piece_name == "empty "
							old_node = current_node
							current_node = current_node.left # move left one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item

						if !current_node.right.nil? && current_node.right.piece_name == "empty "
							old_node = current_node
							current_node = current_node.right # move down one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							# if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
							# 	killed = true
							# end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
							item.piece_name = original_item_piece_name
							item.piece = original_item_piece
							current_node.piece_name = old_piece_name
							current_node.piece = old_piece
						end
						current_node = item

					end


					if @rook_list.include?(item.piece_name) || @queen_list.include?(item.piece_name)
						puts "in while checkmate rook loop... item.piece_name: #{item.piece_name}"
						puts "in while checkmate rook loop... item.coordinates: #{item.coordinates}"
						current_node.piece_name = "empty "
						current_node.piece = " "
						killed = false
						while !current_node.up.nil? && (current_node.up.piece_name == "empty " || enemies.include?(current_node.up.piece_name)) && killed == false
							puts "in while checkmate rook up loop... item.coordinates: #{current_node.coordinates}"
							old_node = current_node
							current_node = current_node.up # move up one
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty " # if there is an enemy piece at this spot, set killed flag to true
								killed = true
							end
							old_piece_name = current_node.piece_name # save the old piece_name
							old_piece = current_node.piece # save the old piece
							current_node.piece_name = original_item_piece_name # set the current node piece_name tentatively to the piece in question
							if !check? # if this piece being here creates or fails to block a check
								current_node.piece_name = old_piece_name # reset the current node's piece name
								current_node.piece = old_piece # recet the current node's piece
								item.piece_name = original_item_piece_name # reset the original item's piece_name (was set to "empty " above)
								item.piece = original_item_piece # reset the original item's piece_name (was set to " " above)
								return false
							end
						end
						item.piece_name = original_item_piece_name
						item.piece = original_item_piece
						current_node.piece_name = old_piece_name
						current_node.piece = old_piece
						current_node = item
						killed = false
						while !current_node.down.nil? && (current_node.down.piece_name == "empty " || enemies.include?(current_node.down.piece_name)) && killed == false
							puts "in while checkmate rook down loop... item.coordinates: #{current_node.coordinates}"
							# current_node.piece_name = "empty "
							# current_node.piece = " "
							old_node = current_node
							current_node = current_node.down
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end
						current_node.piece_name = old_piece_name
						current_node.piece = old_piece
						item.piece_name = original_item_piece_name
						item.piece = original_item_piece
						killed = false
						current_node = item
						while !current_node.left.nil? && (current_node.left.piece_name == "empty " || enemies.include?(current_node.left.piece_name)) && killed == false
							puts "in while checkmate rook left loop... item.coordinates: #{current_node.coordinates}"
							# current_node.piece_name = "empty "
							# current_node.piece = " "
							old_node = current_node
							current_node = current_node.left
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end
						current_node.piece_name = old_piece_name
						current_node.piece = old_piece
						item.piece_name = original_item_piece_name
						item.piece = original_item_piece
						killed = false
						current_node = item
						while !current_node.right.nil? && (current_node.right.piece_name == "empty " || enemies.include?(current_node.right.piece_name)) && killed == false
							puts "in while checkmate rook right loop... item.coordinates: #{current_node.coordinates}"
							# current_node.piece_name = "empty "
							# current_node.piece = " "
							old_node = current_node
							current_node = current_node.right
							old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
							old_node.piece = " " # resets previous node's piece to " "
							if current_node.piece_name != "empty "
								killed = true
							end
							old_piece_name = current_node.piece_name
							old_piece = current_node.piece
							current_node.piece_name = original_item_piece_name
							if !check?
								current_node.piece_name = old_piece_name
								current_node.piece = old_piece
								item.piece_name = original_item_piece_name
								item.piece = original_item_piece
								return false
							end
						end
						current_node.piece_name = old_piece_name
						current_node.piece = old_piece
						item.piece_name = original_item_piece_name
						item.piece = original_item_piece

						

					end # if rook or queen

					# if @bishop_list.include?(item.piece_name) || @queen_list.include?(item.piece_name)
					# 	puts "in while checkmate rook loop... item.piece_name: #{item.piece_name}"
					# 	puts "in while checkmate rook loop... item.coordinates: #{item.coordinates}"
					# 	current_node.piece_name = "empty "
					# 	current_node.piece = " "
					# 	killed = false
					# 	while !current_node.up.nil? && !current_node.up.left.nil? && (current_node.up.left.piece_name == "empty " || enemies.include?(current_node.up.left.piece_name)) && killed == false
					# 		old_node = current_node
					# 		current_node = current_node.up.left
					# 		old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
					# 		old_node.piece = " " # resets previous node's piece to " "
					# 		if current_node.piece_name != "empty "
					# 			killed = true
					# 		end
					# 		old_piece_name = current_node.piece_name
					# 		old_piece = current_node.piece
					# 		current_node.piece_name = original_item_piece_name
					# 		puts "in while checkmate bishop up left loop... item.coordinates: #{current_node.coordinates}"
					# 		if !check?
					# 			current_node.piece_name = old_piece_name
					# 			current_node.piece = old_piece
					# 			item.piece_name = original_item_piece_name
					# 			item.piece = original_item_piece
					# 			return false
					# 		end
					# 	end
					# 	item.piece_name = original_item_piece_name
					# 	item.piece = original_item_piece
					# 	current_node.piece_name = old_piece_name
					# 	current_node.piece = old_piece
					# 	current_node = item
					# 	killed = false
					# 	while !current_node.up.nil? && !current_node.up.right.nil? && (current_node.up.right.piece_name == "empty " || enemies.include?(current_node.up.right.piece_name)) && killed == false
					# 		# current_node.piece_name = "empty "
					# 		# current_node.piece = " "
					# 		old_node = current_node
					# 		current_node = current_node.up.right
					# 		old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
					# 		old_node.piece = " " # resets previous node's piece to " "
					# 		puts "in while checkmate bishop up right loop... item.coordinates: #{current_node.coordinates}"
					# 		if current_node.piece_name != "empty "
					# 			killed = true
					# 		end
					# 		old_piece_name = current_node.piece_name
					# 		old_piece = current_node.piece
					# 		current_node.piece_name = original_item_piece_name
					# 		if !check?
					# 			current_node.piece_name = old_piece_name
					# 			current_node.piece = old_piece
					# 			item.piece_name = original_item_piece_name
					# 			item.piece = original_item_piece
					# 			return false
					# 		end
					# 	end
					# 	current_node.piece_name = old_piece_name
					# 	current_node.piece = old_piece
					# 	item.piece_name = original_item_piece_name
					# 	item.piece = original_item_piece
					# 	killed = false
					# 	current_node = item
					# 	while !current_node.down.nil? && !current_node.down.left.nil? && (current_node.down.left.piece_name == "empty " || enemies.include?(current_node.down.left.piece_name)) && killed == false
					# 		# current_node.piece_name = "empty "
					# 		# current_node.piece = " "
					# 		old_node = current_node
					# 		current_node = current_node.down.left
					# 		old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
					# 		old_node.piece = " " # resets previous node's piece to " "
					# 		if current_node.piece_name != "empty "
					# 			killed = true
					# 		end
					# 		old_piece_name = current_node.piece_name
					# 		old_piece = current_node.piece
					# 		current_node.piece_name = original_item_piece_name
					# 		puts "in while checkmate bishop down left loop... item.coordinates: #{current_node.coordinates}"
					# 		if !check?
					# 			current_node.piece_name = old_piece_name
					# 			current_node.piece = old_piece
					# 			item.piece_name = original_item_piece_name
					# 			item.piece = original_item_piece
					# 			return false
					# 		end
					# 	end
					# 	current_node.piece_name = old_piece_name
					# 	current_node.piece = old_piece
					# 	item.piece_name = original_item_piece_name
					# 	item.piece = original_item_piece
					# 	killed = false
					# 	current_node = item
					# 	puts "entry: #{!current_node.down.nil? && !current_node.down.right.nil? && (current_node.down.right.piece_name == "empty " || enemies.include?(current_node.down.right.piece_name)) && killed == false}"
					# 	while !current_node.down.nil? && !current_node.down.right.nil? && (current_node.down.right.piece_name == "empty " || enemies.include?(current_node.down.right.piece_name)) && killed == false
					# 		# current_node.piece_name = "empty "
					# 		# current_node.piece = " "
					# 		old_node = current_node
					# 		current_node = current_node.down.right
					# 		old_node.piece_name = "empty " # resets previous node's piece_name to "empty "
					# 		old_node.piece = " " # resets previous node's piece to " "
					# 		if current_node.piece_name != "empty "
					# 			killed = true
					# 		end
					# 		old_piece_name = current_node.piece_name
					# 		old_piece = current_node.piece
					# 		current_node.piece_name = original_item_piece_name
					# 		puts "in while checkmate bishop down right loop... item.coordinates: #{current_node.coordinates}"
					# 		if !check?
					# 			current_node.piece_name = old_piece_name
					# 			current_node.piece = old_piece
					# 			item.piece_name = original_item_piece_name
					# 			item.piece = original_item_piece
					# 			return false
					# 		end
					# 	end
					# 	current_node.piece_name = old_piece_name
					# 	current_node.piece = old_piece
					# 	item.piece_name = original_item_piece_name
					# 	item.piece = original_item_piece

						

					# end # if bishop or queen


				end
			end
		end
		return true
	end
	
	
	def check?
		# puts "checking..."
		# puts "in check?... @this_move_piece_name: #{@this_move_piece_name}"
		# puts "@this_move_direction: #{@this_move_direction}"
		# puts "@this_move_distance: #{@this_move_distance}"

		# puts "player: #{player}"
		# piece_node = node_of(piece_name)

		player = 1 if @turn % 2 != 0
		player = 2 if @turn % 2 == 0


		if @mistake == 0
			return false
		end
		
		if player == 1
			king = "wk "
			enemies = @black_list
			friends = @white_list
		else
			king = "bk "
			enemies = @white_list
			friends = @black_list
		end
		found = false

		if @done_moving == false
			old_node = node_of(@this_move_piece_name)
			old_node_piece = old_node.piece
			move(@this_move_piece_name,@this_move_direction,@this_move_distance)
			new_node = node_of(@this_move_piece_name)
		end
		# puts "current_node: #{current_node}"
		# puts "current_node.coordinates: #{current_node.coordinates}"
		# puts "current_node.up.nil?: #{current_node.up.nil?}"
		# puts "!found: #{!found}"
		# puts ""
		# puts "entry: #{!current_node.up.nil? && !found}"



		current_node = node_of(king)
		# puts "king: #{king}"
		# puts "node_of('wk ').coordinates: #{node_of("wk ").coordinates}"
		# puts "node_of('bk ').coordinates: #{node_of("bk ").coordinates}"
		# puts "current_node: #{current_node}"
		while !current_node.up.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.up
			if current_node.piece_name != "empty "
				if (@rook_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
		end
		current_node = node_of(king)
		found = false
		while !current_node.down.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.down
			if current_node.piece_name != "empty "
				if (@rook_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
		end
		current_node = node_of(king)
		found = false
		while !current_node.left.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.left
			if current_node.piece_name != "empty "
				if (@rook_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
		end
		current_node = node_of(king)
		found = false
		while !current_node.right.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.right
			if current_node.piece_name != "empty "
				if (@rook_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
		end

		current_node = node_of(king)
		found = false
		spots = 1
		while !current_node.up.nil? && !current_node.up.right.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			last_node = current_node
			current_node = current_node.up.right
			if current_node.piece_name != "empty "
				if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				   (@pawn_list.include?(current_node.piece_name) && player == 1 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
			spots += 1
		end

		current_node = node_of(king)
		found = false
		spots = 1
		while !current_node.up.nil? && !current_node.up.left.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.up.left
			if current_node.piece_name != "empty "
				if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
					(@pawn_list.include?(current_node.piece_name) && player == 1 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
			spots += 1
		end

		current_node = node_of(king)
		found = false
		spots = 1
		while !current_node.down.nil? && !current_node.down.right.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.down.right
			if current_node.piece_name != "empty "
				if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
					(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
			spots += 1
		end

		current_node = node_of(king)
		found = false
		spots = 1
		while !current_node.down.nil? && !current_node.down.left.nil? && !found
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.down.left
			if current_node.piece_name != "empty "
				if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
					(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				end
				found = true
			end
			spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.left.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.up.up.left
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end





		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.right.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.up.up.right
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.up.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.right.right.up
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.down.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.right.right.down
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.right.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.down.down.right
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.left.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.down.down.left
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.down.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.left.left.down
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		current_node = node_of(king)
		found = false
		# spots = 1
		if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.up.nil?
			# puts "in while loop... current_node.coordinates: #{current_node.coordinates}"
			current_node = current_node.left.left.up
			if @knight_list.include?(current_node.piece_name) && enemies.include?(current_node.piece_name)
				# if (@bishop_list.include?(current_node.piece_name) || @queen_list.include?(current_node.piece_name)) && enemies.include?(current_node.piece_name) ||
				# 	(@pawn_list.include?(current_node.piece_name) && player == 2 && enemies.include?(current_node.piece_name) && spots == 1)
					if @done_moving == false
						old_node.piece = old_node_piece
						old_node.piece_name = @this_move_piece_name		
						new_node.piece = @last_piece
						new_node.piece_name = @last_piece_name
					end
					puts "INVALID MOVE, PUTS YOUR KING IN DANGER!"
					return true
				# end
				# found = true
			end
			# spots += 1
		end

		


		if @done_moving == false
			old_node.piece = old_node_piece
			old_node.piece_name = @this_move_piece_name		
			new_node.piece = @last_piece
			new_node.piece_name = @last_piece_name
		end

		puts "COOL, NOT IN CHECK!"
		

		return false
	end









	def valid_move?(piece_name,direction,distance,player)
		if (player == 1 && !@white_list.include?(piece_name)) || (player == 2 && !@black_list.include?(piece_name))
			puts "INVALID PIECE SELECTION"
			return false
		end
		
		@all_clear = all_clear?(piece_name,direction,distance)
		puts "@all_clear: #{@all_clear}"
		piece = node_of(piece_name)
		
puts "entry: #{(@spots_traveled[piece_name])}"
		if @pawn_list.include?(piece_name)
			if @white_list.include?(piece_name)
				if (direction == "u" && (node_of(piece_name).coordinates[0] + distance) < 9 && @all_clear && distance < 2) ||
				   (direction == "u" && @spots_traveled[piece_name] == 0 && distance < 3 && @all_clear) ||
				   (direction == "ul" && !piece.up.left.nil? && @black_list.include?(piece.up.left.piece_name) && distance == 1) ||
				   (direction == "ur" && !piece.up.right.nil? && @black_list.include?(piece.up.right.piece_name) && distance == 1)
					return true
				else
					puts "INVALID MOVE"
					return false
				end
			elsif @black_list.include?(piece_name)
				if (direction == "d" && (node_of(piece_name).coordinates[0] - distance) > 0 && @all_clear && distance < 2) ||
				   (direction == "d" && @spots_traveled[piece_name] == 0 && distance < 3 && @all_clear) ||
				   (direction == "dl" && !piece.down.left.nil? && @white_list.include?(piece.down.left.piece_name) && distance == 1) ||
				   (direction == "dr" && !piece.down.right.nil? && @white_list.include?(piece.down.right.piece_name) && distance == 1)
					return true
				else 
					puts "INVALID MOVE"
					return false													
				end
			else
				puts "INVALID MOVE"
				return false	
			end


		elsif @rook_list.include?(piece_name)
			if @white_list.include?(piece_name)
				if (direction == "u" && (node_of(piece_name).coordinates[0] + distance) < 9 && @all_clear) ||
				   (direction == "r" && (node_of(piece_name).coordinates[1] + distance) < 9 && @all_clear) ||
				   (direction == "d" && (node_of(piece_name).coordinates[0] - distance) > 0 && @all_clear) ||
				   (direction == "l" && (node_of(piece_name).coordinates[1] - distance) > 0 && @all_clear)
					return true
				else
					puts "INVALID MOVE"
					return false
				end
			elsif @black_list.include?(piece_name)
				if (direction == "u" && (node_of(piece_name).coordinates[0] + distance) < 9 && @all_clear) ||
				   (direction == "r" && (node_of(piece_name).coordinates[1] + distance) < 9 && @all_clear) ||
				   (direction == "d" && (node_of(piece_name).coordinates[0] - distance) > 0 && @all_clear) ||
				   (direction == "l" && (node_of(piece_name).coordinates[1] - distance) > 0 && @all_clear)
					 return true
				else 
					puts "INVALID MOVE"
					return false													
				end
			else
				puts "INVALID MOVE"
				return false
			end	
			
		elsif @bishop_list.include?(piece_name)
			
			if (direction == "ul" && (node_of(piece_name).coordinates[0] + distance) < 9 && (node_of(piece_name).coordinates[1] - distance) > 0 && @all_clear) ||
			   (direction == "ur" && (node_of(piece_name).coordinates[0] + distance) < 9 && (node_of(piece_name).coordinates[1] + distance) < 9 && @all_clear) ||
			   (direction == "dl" && (node_of(piece_name).coordinates[0] - distance) > 0 && (node_of(piece_name).coordinates[1] - distance) > 0 && @all_clear) ||
			   (direction == "dr" && (node_of(piece_name).coordinates[0] - distance) > 0 && (node_of(piece_name).coordinates[1] + distance) < 9 && @all_clear)
				return true
			else
				puts "INVALID MOVE"
				return false
			end

		elsif @knight_list.include?(piece_name)
			
			if (direction == "kur" || direction == "kru" || direction == "krd" || direction == "kdr" || direction == "kdl" || direction == "kld" || direction == "klu" || direction == "kul") && @all_clear
			   	return true
			else
				puts "INVALID MOVE"
				return false
			end

		elsif @queen_list.include?(piece_name)
			
			if (direction == "u" || direction == "r" || direction == "d" || direction == "l" || direction == "ur" || direction == "dr" || direction == "dl" || direction == "ul") && @all_clear
			   	return true
			else
				puts "INVALID MOVE"
				return false
			end
			
		elsif @king_list.include?(piece_name)
			
			if (direction == "u" || direction == "r" || direction == "d" || direction == "l" || direction == "ur" || direction == "dr" || direction == "dl" || direction == "ul") && @all_clear
				return true
			else
				puts "INVALID MOVE"
				return false
			end
			# puts "white check: #{check?("wp1 ",direction)}"
			# puts "black check: #{check?("bp1 ",direction)}"
		end
	end



	def all_clear?(piece_name,direction,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			
			
			if direction == "u"

				# puts "all_clear before killed one check @killed_one: #{@killed_one}"
				if !current_node.up.nil? && @killed_one == false
					# puts "piece_name: #{piece_name}"
					# puts "current_node.up.piece_name == empty: #{current_node.up.piece_name == "empty "}"
					
					if (@pawn_list.include?(piece_name) && current_node.up.piece_name == "empty ") ||
						(!@pawn_list.include?(piece_name) && @white_list.include?(piece_name) && (@black_list.include?(current_node.up.piece_name) || current_node.up.piece_name == "empty ")) ||
						(!@pawn_list.include?(piece_name) && @black_list.include?(piece_name) && (@white_list.include?(current_node.up.piece_name) || current_node.up.piece_name == "empty "))
					
						if (@white_list.include?(piece_name) && @black_list.include?(current_node.up.piece_name)) ||
						   (@black_list.include?(piece_name) && @white_list.include?(current_node.up.piece_name))
						   @killed_one = true
						end
						current_node = current_node.up
					else
						return false
					end
				else
					# show_board
					@killed_one = false
					return false
				end
			end

			if direction == "d"
				
				if !current_node.down.nil? && @killed_one == false
					if (@pawn_list.include?(piece_name) && current_node.down.piece_name == "empty ") ||
						(!@pawn_list.include?(piece_name) && @white_list.include?(piece_name) && (@black_list.include?(current_node.down.piece_name) || current_node.down.piece_name == "empty ")) ||
						(!@pawn_list.include?(piece_name) && @black_list.include?(piece_name) && (@white_list.include?(current_node.down.piece_name) || current_node.down.piece_name == "empty "))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.down.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.down.piece_name))
							@killed_one = true
						 end
						current_node = current_node.down
					else
						return false
					end
				else
					# show_board
					@killed_one = false
					return false
				end
			end

			if direction == "l"
				
				if !current_node.left.nil? && @killed_one == false &&
				   (@rook_list.include?(piece_name) || @queen_list.include?(piece_name) ||@king_list.include?(piece_name)) &&
				   (@white_list.include?(piece_name) && (@black_list.include?(current_node.left.piece_name) || current_node.left.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.left.piece_name) || current_node.left.piece_name == "empty "))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.left.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.left.piece_name))
							@killed_one = true
						 end
						current_node = current_node.left
				else
					@killed_one = false
					return false
				end
			end

			if direction == "r"
				
				if !current_node.right.nil? && @killed_one == false &&
				   (@rook_list.include?(piece_name) || @queen_list.include?(piece_name) ||@king_list.include?(piece_name)) &&
				   (@white_list.include?(piece_name) && (@black_list.include?(current_node.right.piece_name) || current_node.right.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.right.piece_name) || current_node.right.piece_name == "empty "))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.right.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.right.piece_name))
							@killed_one = true
						 end
						current_node = current_node.right
				else
					@killed_one = false
					return false
				end
			end

			if direction == "ul"
				
				if !current_node.up.left.nil? && @killed_one == false &&
				   (@bishop_list.include?(piece_name) || @queen_list.include?(piece_name) || @king_list.include?(piece_name)) &&
				   (@white_list.include?(piece_name) && (@black_list.include?(current_node.up.left.piece_name) || current_node.up.left.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.up.left.piece_name) || current_node.up.left.piece_name == "empty "))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.up.left.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.up.left.piece_name))
							@killed_one = true
							puts "@killed_one: #{@killed_one}"
						 end
						current_node = current_node.up.left
				else
					@killed_one = false
					return false
				end
			end

			if direction == "ur"
				
				if !current_node.up.right.nil? && @killed_one == false &&
				   (@bishop_list.include?(piece_name) || @queen_list.include?(piece_name) || @king_list.include?(piece_name)) &&
				   (@white_list.include?(piece_name) && (@black_list.include?(current_node.up.right.piece_name) || current_node.up.right.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.up.right.piece_name) || current_node.up.right.piece_name == "empty "))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.up.right.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.up.right.piece_name))
							@killed_one = true
							puts "@killed_one: #{@killed_one}"
						 end
						current_node = current_node.up.right
				else
					@killed_one = false
					return false
				end
			end

			if direction == "dl"
				
				puts "@killed_one: #{@killed_one}"
				if !current_node.down.left.nil? && @killed_one == false &&
				   (@bishop_list.include?(piece_name) || @queen_list.include?(piece_name) || @king_list.include?(piece_name)) &&
				   ((@white_list.include?(piece_name) && (@black_list.include?(current_node.down.left.piece_name) || current_node.down.left.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.down.left.piece_name) || current_node.down.left.piece_name == "empty ")))
				   puts "in forbidden loop!"
						if (@white_list.include?(piece_name) && @black_list.include?(current_node.down.left.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.down.left.piece_name))
							@killed_one = true
						 end
						current_node = current_node.down.left
				else
					@killed_one = false
					puts "returning false"
					return false
				end
			end

			if direction == "dr"
				
				if !current_node.down.right.nil? && @killed_one == false &&
				   (@bishop_list.include?(piece_name) || @queen_list.include?(piece_name) || @king_list.include?(piece_name)) &&
				   ((@white_list.include?(piece_name) && (@black_list.include?(current_node.down.right.piece_name) || current_node.down.right.piece_name == "empty ")) ||
				   (@black_list.include?(piece_name) && (@white_list.include?(current_node.down.right.piece_name) || current_node.down.right.piece_name == "empty ")))

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.down.right.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.down.right.piece_name))
							@killed_one = true
							puts "@killed_one: #{@killed_one}"
						 end
						current_node = current_node.down.right
				else
					@killed_one = false
					return false
				end
			end

			if direction == "kur"
				
				if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.right.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.up.up.right.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.up.up.right.piece_name)) ||current_node.up.up.right.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.up.up.right.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.up.up.right.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.up.up.right
				 else
					 @killed_one = false
					 return false
				 end
			end

			if direction == "kru"
				
				if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.up.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.right.right.up.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.right.right.up.piece_name)) ||current_node.right.right.up.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.right.right.up.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.right.right.up.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.right.right.up
				 else
					 @killed_one = false
					 return false
				 end
			end

			if direction == "krd"
				# puts "@white_list.include?(piece_name): #{@white_list.include?(piece_name)}"
				# puts "@black_list.include?(current_node.right.right.down.piece_name): #{@black_list.include?(current_node.right.right.down.piece_name)}"
				# puts "current_node.right.right.down.piece_name == "empty ": #{current_node.right.right.down.piece_name == "empty "}"
				# puts "entry: #{@knight_list.include?(piece_name) && ((@white_list.include?(piece_name) && @black_list.include?(current_node.right.right.down.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.right.right.down.piece_name)) ||current_node.right.right.down.piece_name == "empty ")}"
				
				if !current_node.right.nil? && !current_node.right.right.nil? && !current_node.right.right.down.nil? &&
				   @knight_list.include?(piece_name) &&
				   ((@white_list.include?(piece_name) && @black_list.include?(current_node.right.right.down.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.right.right.down.piece_name)) ||current_node.right.right.down.piece_name == "empty ")

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.right.right.down.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.right.right.down.piece_name))
							@killed_one = true
							puts "@killed_one: #{@killed_one}"
						 end
						current_node = current_node.right.right.down
				else
					@killed_one = false
					return false
				end
			end

			if direction == "kdr"
				
				if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.right.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.down.down.right.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.down.down.right.piece_name)) ||current_node.down.down.right.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.down.down.right.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.down.down.right.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.down.down.right
				 else
					 @killed_one = false
					 return false
				 end
			end

			if direction == "kdl"
				
				if !current_node.down.nil? && !current_node.down.down.nil? && !current_node.down.down.left.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.down.down.left.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.down.down.left.piece_name)) ||current_node.down.down.left.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.down.down.left.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.down.down.left.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.down.down.left
				 else
					 @killed_one = false
					 return false
				 end
			end

			if direction == "kld"
				
				if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.down.nil? &&
				   @knight_list.include?(piece_name) &&
				   ((@white_list.include?(piece_name) && @black_list.include?(current_node.left.left.down.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.left.left.down.piece_name)) ||current_node.left.left.down.piece_name == "empty ")

						if (@white_list.include?(piece_name) && @black_list.include?(current_node.left.left.down.piece_name)) ||
							(@black_list.include?(piece_name) && @white_list.include?(current_node.left.left.down.piece_name))
							@killed_one = true
							puts "@killed_one: #{@killed_one}"
						 end
						current_node = current_node.left.left.down
				else
					@killed_one = false
					return false
				end
			end

			if direction == "klu"
				
				if !current_node.left.nil? && !current_node.left.left.nil? && !current_node.left.left.up.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.left.left.up.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.left.left.up.piece_name)) ||current_node.left.left.up.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.left.left.up.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.left.left.up.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.left.left.up
				 else
					 @killed_one = false
					 return false
				 end
			end

			if direction == "kul"
				
				if !current_node.up.nil? && !current_node.up.up.nil? && !current_node.up.up.left.nil? &&
					@knight_list.include?(piece_name) &&
					((@white_list.include?(piece_name) && @black_list.include?(current_node.up.up.left.piece_name)) || (@black_list.include?(piece_name) && @white_list.include?(current_node.up.up.left.piece_name)) ||current_node.up.up.left.piece_name == "empty ")
 
						 if (@white_list.include?(piece_name) && @black_list.include?(current_node.up.up.left.piece_name)) ||
							 (@black_list.include?(piece_name) && @white_list.include?(current_node.up.up.left.piece_name))
							 @killed_one = true
							 puts "@killed_one: #{@killed_one}"
						  end
						 current_node = current_node.up.up.left
				 else
					 @killed_one = false
					 return false
				 end
			end
			
			spots += 1
		end
		@killed_one = false
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
		elsif direction == "ul"
			move_up_left(piece_name,distance)
		elsif direction == "ur"
			move_up_right(piece_name,distance)
		elsif direction == "dl"
			move_down_left(piece_name,distance)
		elsif direction == "dr"
			move_down_right(piece_name,distance)
		elsif direction == "kur"
			move_knight_up_right(piece_name,distance)
		elsif direction == "klu"
			move_knight_left_up(piece_name,distance)
		elsif direction == "kld"
			move_knight_left_down(piece_name,distance)
		elsif direction == "kdr"
			move_knight_down_right(piece_name,distance)
		elsif direction == "kdl"
			move_knight_down_left(piece_name,distance)
		elsif direction == "krd"
			move_knight_right_down(piece_name,distance)
		elsif direction == "kru"
			move_knight_right_up(piece_name,distance)
		elsif direction == "kul"
			move_knight_up_left(piece_name,distance)
		end
			

	end # move(piece,destination)

	def move_up(piece_name,distance)
		
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			if @white_list.include?(current_node.up.piece_name)
				@white_mortalities.push("#{current_node.up.piece}#{current_node.up.piece_name[-1]}")
			end

			if @black_list.include?(current_node.up.piece_name)
				@black_mortalities.push("#{current_node.up.piece}#{current_node.up.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.up.piece_name
			@last_piece = current_node.up.piece
			current_node.up.piece_name = piece_name
			current_node.up.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.up
			spots += 1
			# if @done_moving == false
			# end
			puts "spots: #{spots}"
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
			if @white_list.include?(current_node.right.piece_name)
				@white_mortalities.push("#{current_node.right.piece}#{current_node.right.piece_name[-1]}")
			end

			if @black_list.include?(current_node.right.piece_name)
				@black_mortalities.push("#{current_node.right.piece}#{current_node.right.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.right.piece_name
			@last_piece = current_node.right.piece
			current_node.right.piece_name = piece_name
			current_node.right.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.right
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_down(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			puts "in move_down... current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			if @white_list.include?(current_node.down.piece_name)
				@white_mortalities.push("#{current_node.down.piece}#{current_node.down.piece_name[-1]}")
			end

			if @black_list.include?(current_node.down.piece_name)
				@black_mortalities.push("#{current_node.down.piece}#{current_node.down.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.down.piece_name
			@last_piece = current_node.down.piece
			current_node.down.piece_name = piece_name
			current_node.down.piece = current_node.piece
			current_node.piece_name = "empty "
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
			if @white_list.include?(current_node.left.piece_name)
				@white_mortalities.push("#{current_node.left.piece}#{current_node.left.piece_name[-1]}")
			end

			if @black_list.include?(current_node.left.piece_name)
				@black_mortalities.push("#{current_node.left.piece}#{current_node.left.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.left.piece_name
			@last_piece = current_node.left.piece
			current_node.left.piece_name = piece_name
			current_node.left.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.left
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_up_left(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			if @white_list.include?(current_node.up.left.piece_name)
				@white_mortalities.push("#{current_node.up.left.piece}#{current_node.up.left.piece_name[-1]}")
			end

			if @black_list.include?(current_node.up.left.piece_name)
				@black_mortalities.push("#{current_node.up.left.piece}#{current_node.up.left.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.up.left.piece_name
			@last_piece = current_node.up.left.piece
			current_node.up.left.piece_name = piece_name
			current_node.up.left.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.up.left
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_up_right(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			if @white_list.include?(current_node.up.right.piece_name)
				@white_mortalities.push("#{current_node.up.right.piece}#{current_node.up.right.piece_name[-1]}")
			end

			if @black_list.include?(current_node.up.right.piece_name)
				@black_mortalities.push("#{current_node.up.right.piece}#{current_node.up.right.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.up.right.piece_name
			@last_piece = current_node.up.right.piece
			current_node.up.right.piece_name = piece_name
			current_node.up.right.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.up.right
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_down_left(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		while spots < distance
			# puts "current_node.coordinates: #{current_node.coordinates}"
			# puts "current_node.piece_name: #{current_node.piece_name}"
			# puts "current_node.piece: #{current_node.piece}"
			# puts "current_node: #{current_node}"
			if @white_list.include?(current_node.down.left.piece_name)
				@white_mortalities.push("#{current_node.down.left.piece}#{current_node.down.left.piece_name[-1]}")
			end

			if @black_list.include?(current_node.down.left.piece_name)
				@black_mortalities.push("#{current_node.down.left.piece}#{current_node.down.left.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.down.left.piece_name
			@last_piece = current_node.down.left.piece
			current_node.down.left.piece_name = piece_name
			current_node.down.left.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.down.left
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)


	def move_down_right(piece_name,distance)
		current_node = node_of(piece_name)
		spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		while spots < distance
			if @white_list.include?(current_node.down.right.piece_name)
				@white_mortalities.push("#{current_node.down.right.piece}#{current_node.down.right.piece_name[-1]}")
			end

			if @black_list.include?(current_node.down.right.piece_name)
				@black_mortalities.push("#{current_node.down.right.piece}#{current_node.down.right.piece_name[-1]}")
			end
			@last = current_node
			@last_piece_name = current_node.down.right.piece_name
			@last_piece = current_node.down.right.piece
			current_node.down.right.piece_name = piece_name
			current_node.down.right.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.down.right
			spots += 1
		end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_up_right(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.up.up.right.piece_name)
				@white_mortalities.push("#{current_node.up.up.right.piece}#{current_node.up.up.right.piece_name[-1]}")
			end

			if @black_list.include?(current_node.up.up.right.piece_name)
				@black_mortalities.push("#{current_node.up.up.right.piece}#{current_node.up.up.right.piece_name[-1]}")
			end

			current_node.up.up.right.piece_name = piece_name
			current_node.up.up.right.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.up.up.right
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_right_up(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.right.right.up.piece_name)
				@white_mortalities.push("#{current_node.right.right.up.piece}#{current_node.right.right.up.piece_name[-1]}")
			end

			if @black_list.include?(current_node.right.right.up.piece_name)
				@black_mortalities.push("#{current_node.right.right.up.piece}#{current_node.right.right.up.piece_name[-1]}")
			end

			current_node.right.right.up.piece_name = piece_name
			current_node.right.right.up.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.right.right.up
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_right_down(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.right.right.down.piece_name)
				@white_mortalities.push("#{current_node.right.right.down.piece}#{current_node.right.right.down.piece_name[-1]}")
			end

			if @black_list.include?(current_node.right.right.down.piece_name)
				@black_mortalities.push("#{current_node.right.right.down.piece}#{current_node.right.right.down.piece_name[-1]}")
			end

			current_node.right.right.down.piece_name = piece_name
			current_node.right.right.down.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.right.right.down
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_down_right(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.down.down.right.piece_name)
				@white_mortalities.push("#{current_node.down.down.right.piece}#{current_node.down.down.right.piece_name[-1]}")
			end

			if @black_list.include?(current_node.down.down.right.piece_name)
				@black_mortalities.push("#{current_node.down.down.right.piece}#{current_node.down.down.right.piece_name[-1]}")
			end

			current_node.down.down.right.piece_name = piece_name
			current_node.down.down.right.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.down.down.right
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_down_left(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.down.down.left.piece_name)
				@white_mortalities.push("#{current_node.down.down.left.piece}#{current_node.down.down.left.piece_name[-1]}")
			end

			if @black_list.include?(current_node.down.down.left.piece_name)
				@black_mortalities.push("#{current_node.down.down.left.piece}#{current_node.down.down.left.piece_name[-1]}")
			end

			current_node.down.down.left.piece_name = piece_name
			current_node.down.down.left.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.down.down.left
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_left_down(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.left.left.down.piece_name)
				@white_mortalities.push("#{current_node.left.left.down.piece}#{current_node.left.left.down.piece_name[-1]}")
			end

			if @black_list.include?(current_node.left.left.down.piece_name)
				@black_mortalities.push("#{current_node.left.left.down.piece}#{current_node.left.left.down.piece_name[-1]}")
			end

			current_node.left.left.down.piece_name = piece_name
			current_node.left.left.down.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.left.left.down
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_left_up(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.left.left.up.piece_name)
				@white_mortalities.push("#{current_node.left.left.up.piece}#{current_node.left.left.up.piece_name[-1]}")
			end

			if @black_list.include?(current_node.left.left.up.piece_name)
				@black_mortalities.push("#{current_node.left.left.up.piece}#{current_node.left.left.up.piece_name[-1]}")
			end

			current_node.left.left.up.piece_name = piece_name
			current_node.left.left.up.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.left.left.up
			
		# end # while current_node.coordinates != destination
	end # def move_up(piece_name,distance)

	def move_knight_up_left(piece_name,distance)
		current_node = node_of(piece_name)
		# spots = 0
		# puts "move_ down_right current_node.coordinates: #{current_node.coordinates}"
		# puts "move_ down_right current_node.piece_name: #{current_node.piece_name}"
		# puts "move_ down_right current_node.piece.down.right.coordinates: #{current_node.down.right.coordinates}"
		# puts "move_ down_right current_node.piece.down.right.piece_name: #{current_node.down.right.piece_name}"
		# while spots < distance
			if @white_list.include?(current_node.up.up.left.piece_name)
				@white_mortalities.push("#{current_node.up.up.left.piece}#{current_node.up.up.left.piece_name[-1]}")
			end

			if @black_list.include?(current_node.up.up.left.piece_name)
				@black_mortalities.push("#{current_node.up.up.left.piece}#{current_node.up.up.left.piece_name[-1]}")
			end

			current_node.up.up.left.piece_name = piece_name
			current_node.up.up.left.piece = current_node.piece
			current_node.piece_name = "empty "
			current_node.piece = " "
			current_node = current_node.up.up.left
			
		# end # while current_node.coordinates != destination
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
	puts "| #{node_at([8,1]).piece.encode('utf-8')}#{node_at([8,1]).piece_name[-1]} | #{node_at([8,2]).piece.encode('utf-8')}#{node_at([8,2]).piece_name[-1]} | #{node_at([8,3]).piece.encode('utf-8')}#{node_at([8,3]).piece_name[-1]} | #{node_at([8,4]).piece.encode('utf-8')}#{node_at([8,4]).piece_name[-1]} | #{node_at([8,5]).piece.encode('utf-8')}#{node_at([8,5]).piece_name[-1]} | #{node_at([8,6]).piece.encode('utf-8')}#{node_at([8,6]).piece_name[-1]} | #{node_at([8,7]).piece.encode('utf-8')}#{node_at([8,7]).piece_name[-1]} | #{node_at([8,8]).piece.encode('utf-8')}#{node_at([8,8]).piece_name[-1]} |           black mortalities: #{@black_mortalities}"
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
	puts "| #{node_at([1,1]).piece.encode('utf-8')}#{node_at([1,1]).piece_name[-1]} | #{node_at([1,2]).piece.encode('utf-8')}#{node_at([1,2]).piece_name[-1]} | #{node_at([1,3]).piece.encode('utf-8')}#{node_at([1,3]).piece_name[-1]} | #{node_at([1,4]).piece.encode('utf-8')}#{node_at([1,4]).piece_name[-1]} | #{node_at([1,5]).piece.encode('utf-8')}#{node_at([1,5]).piece_name[-1]} | #{node_at([1,6]).piece.encode('utf-8')}#{node_at([1,6]).piece_name[-1]} | #{node_at([1,7]).piece.encode('utf-8')}#{node_at([1,7]).piece_name[-1]} | #{node_at([1,8]).piece.encode('utf-8')}#{node_at([1,8]).piece_name[-1]} |           white mortalities: #{@white_mortalities}"
	puts "_________________________________________"
	puts ""
	end # show_board
end #class Game

game = Game.new
game.play


# make all directions for all pieces

# attack

# check for checkmate and stalemate

# make it saveable

















