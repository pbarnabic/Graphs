class FringeNode
  attr_accessor :vertex, :distance, :preceding_vertex
  def initialize(vertex, distance, preceding_vertex)
    @vertex = vertex
    @distance = distance
    @preceding_vertex = preceding_vertex
  end
end
