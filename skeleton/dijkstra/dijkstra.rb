# Note: This implementation of Dijkstra's Algorithm relies upon
# the adjacency list implementation of a (weighted) graph, which
# can be found in adjacency_list_graph.rb.

class Dijkstra
  def initialize
  end

  def shortest_path(end_vertex)
    steps = self.find_shortest_path(end_vertex).map{|f_n| f_n.vertex.data.to_s}
    steps.join(" --> ")
  end

  def shortest_path_distance(end_vertex)
    path = self.find_shortest_path(end_vertex)
    path.last.distance
  end

  def find_shortest_path(end_vertex)
  end
end
