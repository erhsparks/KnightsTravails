require_relative 'node'

class Knight
  attr_accessor :visited_pos

  def initialize(pos)
    @pos = pos
    @visited_pos = [pos]
  end

  def build_move_tree
    root = PolyTreeNode.new(@pos)
    queue = [root]
    until queue.empty?
      possible_moves = new_move_positions(queue.shift.value)
      possible_moves.each do |possible_move|
        new_child = PolyTreeNode.new(possible_move)
        root.add_child(new_child)
        queue << new_child
      end
    end
    root
  end

  def new_move_positions(pos)
    possible_moves = Knight.valid_moves(pos)
    possible_moves.delete_if do |possible_move|
      row, col = possible_move
      @visited_pos.include?(possible_move) ||
        !row.between?(0, 7) || !col.between?(0, 7)
    end
    @visited_pos += possible_moves
    possible_moves
  end

  def self.valid_moves(pos)
    i, j = pos
    [[i-2,j-1],[i-2,j+1],[i-1,j-2],[i-1,j+2],
      [i+1,j-2],[i+1,j+2],[i+2,j-1],[i+2,j+1]]
  end
end
