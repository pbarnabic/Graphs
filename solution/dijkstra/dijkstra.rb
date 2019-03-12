# Note: This implementation of Dijkstra's Algorithm relies upon
# the adjacency list implementation of a (weighted) graph, which
# can be found in adjacency_list_graph.rb.

class Dijkstra
  attr_accessor :dijkstra_paths
  def initialize(source_vertex)
    @source_vertex = source_vertex
    self.find_paths
  end

  def change_source(new_source)
    self.source_vertex = new_source
    self.dijkstra_paths = self.find_paths
  end

  def source_vertex
    @source_vertex
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
    shortest_path = Array.new
    temp_node = self.dijkstra_paths[end_vertex.object_id]

    until temp_node.preceding_vertex == temp_node.vertex
      shortest_path << temp_node
      temp_node = self.dijkstra_paths[temp_node.preceding_vertex.object_id]
    end
    shortest_path << temp_node
    shortest_path.reverse
  end

  def find_paths
    fringe = [FringeNode.new(self.source_vertex,0,self.source_vertex)]
    paths = Hash.new
    until fringe.empty?
      closest_vertex_fn = fringe.min{|f_n| f_n.distance} # f_n denotes FringeNode
      current_vertex_fn = fringe.delete(closest_vertex_fn)
      current_vertex = current_vertex_fn.vertex
      paths[current_vertex.object_id] = current_vertex_fn

      current_vertex.edges.each do |edge|
        existing_fringe_idx = fringe.find_index{|f_n| f_n.vertex == edge.end_vertex}
        new_distance = edge.weight + current_vertex_fn.distance
        unless existing_fringe_idx
          temp_fringe_node = FringeNode.new(edge.end_vertex,new_distance,current_vertex)
          fringe << temp_fringe_node
        else
          existing_fringe_node = fringe[existing_fringe_idx]
          if new_distance < existing_fringe_node.distance
            existing_fringe_node.distance = new_distance
            fringe[existing_fringe_idx] = existing_fringe_node
          end
        end
      end
    end
    @dijkstra_paths = paths
  end
end

class FringeNode
  attr_accessor :vertex, :distance, :preceding_vertex
  def initialize(vertex, distance, preceding_vertex)
    @vertex = vertex
    @distance = distance
    @preceding_vertex = preceding_vertex
  end
end
