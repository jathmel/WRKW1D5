require_relative '00_tree_node'


class KnightPathFinder
  OFFSETS = [[2,1], [1,2], [-2, 1], [-1,2], [-1,-2], [-2,-1], [2,-1],[1,-2]]

  def initialize(pos=[0,0])
    @tree = build_move_tree(pos)
    @visited_position = []
  end
  def build_move_tree(pos)
    tree = PolyTreeNode.new(pos)
  end
  def new_move_positions(pos)
    OFFSETS.map do |moves|
      moves[0], moves[1] = moves[0] + pos[0], moves[1] + pos[1]
    end
  end
   def  valid_moves(pos)
     x, y = pos
     return true if (0..8)include?(x) && (0..8).include?(y)
     false
   end



end
