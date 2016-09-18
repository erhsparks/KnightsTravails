class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def dfs(target_value)
    return self if @value == target_value

    @children.each do |child|
      found_node = child.dfs(target_value)
      return found_node if !found_node.nil? && found_node.value == target_value
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      test_node = queue.shift
      return test_node if test_node.value == target_value

      queue += test_node.children
    end

    nil
  end

  def parent=(node)
    return if @parent == node
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise unless @children.include?(child_node) || child_node.nil?
    child_node.parent = nil
  end
end
