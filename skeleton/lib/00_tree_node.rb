require 'byebug'
class PolyTreeNode
  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_p_node)
    @parent.children.delete(self) if !@parent.nil?
    @parent = new_p_node
    if !new_p_node.nil? && !new_p_node.children.include?(self)
      new_p_node.children << self
    end
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child of " if !@children.include?(child_node)
    @children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if target_value == @value
    @children.each do |x|
      result = x.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    tree_queue = [self]
    until tree_queue.empty?
      el = tree_queue.shift
      return el if el.value == target_value
      el.children.each do |child|
        tree_queue << child
      end
    end
  end
end

#
# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
# n4 = PolyTreeNode.new("root4")
# n5 = PolyTreeNode.new("root5")
# n6 = PolyTreeNode.new("root6")
