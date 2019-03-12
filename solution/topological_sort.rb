# Note: This implementation utilizes the adjacency list implementation
# of a graph, an example of which can be found in adjacency_list_graph.rb.

class TopologicalSort
  attr_reader :graph
  attr_accessor :sorted_array, :visited

  def initialize(graph)
    @graph = graph
    @sorted_array = Array.new(self.graph.vertices.count)
    @visited = Hash.new(false)
    self.execute
  end

  def execute
    n = self.graph.vertices.count - 1
    until self.sorted_array.length == self.sorted_array.compact.length
      vertex = self.graph.vertices[self.sorted_array.find_index(nil)]
      n = self.dfs_helper(vertex, n)
    end
  end

  def dfs_helper(start_vertex, n)
    self.visited[start_vertex.object_id] = true
    start_vertex.edges.each do |edge|
      end_vertex = edge.end_vertex
      n = dfs_helper(end_vertex, n) unless self.visited[end_vertex.object_id]
    end
    self.sorted_array[n] = start_vertex
    n - 1
  end
end
