class AdjacencyListGraph
  attr_accessor :vertices

  def initialize
    @vertices = Array.new
  end

  def add_vertex(data=nil)
    new_vertex = Vertex.new(data)
    self.vertices.push(new_vertex)
    new_vertex
  end
end

class Vertex
  attr_accessor :data, :edges
  def initialize(data=nil)
    @data = data
    @edges = Array.new
  end

  def add_new_edge(end_vertex,weight=1)
    new_edge = Edge.new(self,end_vertex,weight)
    self.edges = self.edges.push(new_edge)
  end

  def to_s
    "Data: " + data.to_s
  end
  def inspect
    "Data: " + data.to_s
  end
end

class Edge
  attr_reader :start_vertex, :end_vertex
  attr_accessor :weight

  def initialize(start_vertex,end_vertex,weight=1)
      @start_vertex = start_vertex
      @end_vertex = end_vertex
      @weight = weight
  end
  
  def to_s
    start_vertex.data.to_s + " ---> " + end_vertex.data.to_s
  end
  def inspect
    start_vertex.data.to_s + " ---> " + end_vertex.data.to_s
  end
end
