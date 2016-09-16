class PolyTreeNode
  attr_reader :parent, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if @parent == node
    @parent._children.delete(self) unless @parent.nil?
    @parent = node
    @parent._children << self unless @parent.nil?
  end

  def children
    @children.dup
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise unless @children.include?(child_node) || child_node.nil?
    child_node.parent = nil
  end

  protected
  # Protected method to give a node direct access to another node's
  # children.
  def _children
    @children
  end
end
