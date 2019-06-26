
class Node
	attr_accessor :up, :upRight, :right, :downRight, :down, :downLeft, :left, :upLeft, :coordinates, :piece, :nodes

	def initialize(coordinates)
		@coordinates = coordinates

		@@nodes.push(self)
		# puts "coordinates in initialize: #{@coordinates}"
		# puts ""
	end

	def self.make_nodes

		@@nodes ||= []
		i = 1
		j = 1
		while i < 9
			while j < 9
				node = Node.new([i,j]) unless invalidNode?([i,j])
				j += 1
			end # while coordinates[1] < 9
			j = 0
			i += 1
		end # while coordinates[0] < 9
		@@nodes

	end # self.buildBoard

	def self.invalidNode?(coordinates)
		if coordinates[0] < 1 || coordinates[0] > 8 || coordinates[1] < 1 || coordinates[1] > 8 
			return true
		end
			return false
	end # validNode
end # class Node

board = Node.make_nodes

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
	end

	i = 0
	while i < board.length
		if board[i].coordinates == left_coordinates
			node.left = board[i]
			# puts "node.left.coordinates: #{node.left.coordinates}"
		end
		i += 1
	end

	i = 0
	while i < board.length
		if board[i].coordinates == up_coordinates
			node.up = board[i]
			# puts "node.up.coordinates: #{node.up.coordinates}"
		end
		i += 1
	end

	i = 0
	while i < board.length
		if board[i].coordinates == down_coordinates
			node.down = board[i]
			# puts "node.up.coordinates: #{node.up.coordinates}"
		end
		i += 1
	end

	j += 1
end


node = board[62]
puts "node.coordinates #{node.coordinates}"
if node.left
	puts "node.left.coordinates #{node.left.coordinates}"
end

if node.right
puts "node.right.coordinates #{node.right.coordinates}"
end

if node.up
puts "node.up.coordinates #{node.up.coordinates}"
end

if node.down
puts "node.down.coordinates #{node.down.coordinates}"
end

white_king = "\u265A"
white_queen = "\u265B"
white_rook = "\u265C"
white_bishop = "\u265D"
white_knight = "\u265E"
white_pawn = "\u265F"

black_king = "\u2654"
black_queen = "\u2655"
black_rook = "\u2656"
black_bishop = "\u2657"
black_knight = "\u2658"
black_pawn = "\u2659"
# puts white_king.encode('utf-8')

puts "_________________________________________________"
puts ""
puts "|  #{black_rook.encode('utf-8')}  |  #{black_knight.encode('utf-8')}  |  #{black_bishop.encode('utf-8')}  |  #{black_queen.encode('utf-8')}  |  #{black_king.encode('utf-8')}   |  #{black_bishop.encode('utf-8')}  |  #{black_knight.encode('utf-8')}  |  #{black_rook.encode('utf-8')}  |"
puts "_________________________________________________"
puts ""
puts "|  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |  #{black_pawn.encode('utf-8')}  |"
puts "_________________________________________________"
puts ""
puts "|     |     |     |     |     |     |     |     |"
puts "_________________________________________________"
puts ""
puts "|     |     |     |     |     |     |     |     |"
puts "_________________________________________________"
puts ""
puts "|     |     |     |     |     |     |     |     |"
puts "_________________________________________________"
puts ""
puts "|     |     |     |     |     |     |     |     |"
puts "_________________________________________________"
puts ""
puts "|     |     |     |     |     |     |     |     |"
puts "_________________________________________________"
puts ""
puts "|  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |  #{white_pawn.encode('utf-8')}  |"
puts "_________________________________________________"
puts ""
puts "|  #{white_rook.encode('utf-8')}  |  #{white_knight.encode('utf-8')}  |  #{white_bishop.encode('utf-8')}  |  #{white_queen.encode('utf-8')}  |  #{white_king.encode('utf-8')}   |  #{white_bishop.encode('utf-8')}  |  #{white_knight.encode('utf-8')}  |  #{white_rook.encode('utf-8')}  |"
puts "_________________________________________________"
puts ""

# to do

# add piece information to nodes

# print board with pieces on it


































# Node.buildBoard

# class Node
# 	attr_accessor :left, :right, :up, :down, :coordinates, :nodes

# 	def initialize(coordinates,nodes)
# 		@coordinates = coordinates
# 		@nodes = nodes
# 		@nodes.push(self.coordinates)
		
# 	end

# 	def insert_right
# 		last_node = self
# 		puts "last_node.coordinates #{last_node.coordinates}"
# 		if last_node.coordinates[1] > 7
# 			up_coordinates = [last_node.coordinates[0]+1,1]
# 			if up_coordinates[0] < 9
# 				new_node = Node.new(up_coordinates,@nodes)
# 				new_node.insert_right
# 			end
# 		else
# 			last_node.coordinates[1] < 8
# 			right_coordinates = [last_node.coordinates[0],last_node.coordinates[1]+1]
# 			new_node = Node.new(right_coordinates,@nodes)
# 			puts "new_node.coordinates (right)#{new_node.coordinates}"
# 			# sleep(0.5)
# 			new_node.right = new_node.insert_right
# 			puts "finished going right"
# 			new_node.left = last_node
# 		end
# 	end

	# def insert_up
	# 	last_node = self
	# 	if last_node.coordinates[0] < 8
	# 		up_coordinates = [last_node.coordinates[0]+1,last_node.coordinates[1]]
	# 		new_node = Node.new(up_coordinates,@nodes)
	# 		puts "new_node.coordinates (up)#{new_node.coordinates}"
	# 		new_node.down = last_node
	# 		new_node.right = new_node.insert_right
	# 		# new_node.up = new_node.insert_up(new_node)
	# 	end
	# 	new_node
	# end

# 	def self.build_board
# 		board = Node.new([1,1],[])
# 		board.right = board.insert_right
# 		# puts "board.right.coordinates: #{board.right.right.coordinates}"
# 		# board.up = board.insert_up(board)
# 		# puts "board.up.coordinates: #{board.up.coordinates}"
# 		board
# 	end

# end

# node = Node.new(1,[])
# puts "node: #{node.inspect}"
# board = Node.build_board
# puts "board: #{board.up.up.right.right.up.right.coordinates}"
# puts "board.nodes: #{board.nodes}"
# thing = board.up.up.up.up.up.up
# thing = board.right
# puts "thing: #{thing.coordinates}"
# puts "thing.left: #{thing.left.coordinates}"
# puts "thing.right: #{thing.right.coordinates}"
# puts "thing.up: #{thing.up.coordinates}"
# puts "thing.down: #{thing.down.coordinates}"
