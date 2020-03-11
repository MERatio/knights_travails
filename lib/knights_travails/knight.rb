# frozen_string_literal: true

# Represents the knight
class Knight
  attr_accessor :position, :moves, :prev_move
  def initialize(position = [0, 0], prev_move = nil)
    @position = position
    @moves = possible_moves(position)
    @prev_move = prev_move
  end

  # Shows the simplest possible way to get from one square to another
  # by outputting all squares the knight will stop on along the way
  def knight_moves(start, goal)
    raise StandardError, 'Invalid start position' unless valid_position?(start)
    raise StandardError, 'Invalid goal position' unless valid_position?(goal)

    squares = find_squares(start, goal)
    puts "You made it in #{squares.length - 1} moves! Heres your path:"
    squares.each { |square| p square }
  end

  private

  # Returns the possible moves of a knight could make depending on its position
  def possible_moves(position)
    knight_moves = [[1, 2], [2, 1], [2, -1], [1, -2],
                    [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    knight_moves = knight_moves.select do |knight_move|
      knight_move[0] += position[0]
      knight_move[1] += position[1]
      true if valid_position?(knight_move)
    end
    knight_moves
  end

  def valid_position?(move)
    move.all? { |axis| axis >= 0 && axis <= 7 }
  rescue StandardError
    puts 'Invalid input'
  end

  def find_squares(start, goal)
    goal = find_goal(start, goal)
    squares = []
    until goal.nil?
      squares << goal.position
      goal = goal.prev_move
    end
    squares.reverse
  end

  def find_goal(start, goal)
    cur = Knight.new(start)
    queue = [cur]
    until cur.position == goal
      queue.shift
      cur.moves.each { |move| queue << Knight.new(move, cur) }
      cur = queue.shift
    end
    cur
  end
end
