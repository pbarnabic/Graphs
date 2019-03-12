class AdjacencyMatrixGraph
  attr_accessor :matrix
  def initialize(size=1)
    @matrix = Array.new(size) { Array.new(size, false)}
  end
  def add_edge(from_idx,to_idx)
    self.matrix[from_idx][to_idx] = true
  end
end
