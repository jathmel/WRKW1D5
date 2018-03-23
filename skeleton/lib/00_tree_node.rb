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
end
