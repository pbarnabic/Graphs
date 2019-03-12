# Note: Both of these utilize the adjacency list graph implementation, which can
# be found in adjacency_list_graph.rb

def depth_first_search(start_vertex,visited=Hash.new(false))
  p "Visited: " + start_vertex.data.to_s; visited[start_vertex.object_id] = true
  start_vertex.edges.each do |edge|
    puts visited.object_id
    depth_first_search(edge.end_vertex,visited) unless visited[edge.end_vertex.object_id]
  end
end

def breadth_first_search(start_vertex, vertex_queue = Array.new, visited=Hash.new(false))
  p "Visited: " + start_vertex.data.to_s; visited[start_vertex.object_id] = true
  vertex_queue.push(start_vertex)
  until vertex_queue.empty?
    current_vertex = vertex_queue.shift
    current_vertex.edges.each do |edge|
      end_vertex = edge.end_vertex
      unless visited[end_vertex.object_id]
        p "Visited: " + end_vertex.data.to_s; visited[end_vertex.object_id] = true
        vertex_queue.push(end_vertex)
      end
    end
  end
end
