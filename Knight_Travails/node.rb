class TreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.remove_child

    @parent = node
    self.parent.add_child
  end

  private
  def add_child
    @children << self.value
  end

  def remove_child
    @children.delete(self.value)
  end
end
