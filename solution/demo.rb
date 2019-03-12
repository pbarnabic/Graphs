require './adjacency_list_graph'
require './adjacency_matrix_graph'
require './bfs_dfs.rb'
require './dijkstra/dijkstra'
require './topological_sort.rb'

test_graph = AdjacencyListGraph.new

test_vertex_a = test_graph.add_vertex("A")
test_vertex_b = test_graph.add_vertex("B")
test_vertex_c = test_graph.add_vertex("C")
test_vertex_d = test_graph.add_vertex("D")
test_vertex_e = test_graph.add_vertex("E")
test_vertex_f = test_graph.add_vertex("F")
test_vertex_g = test_graph.add_vertex("G")
test_vertex_a.add_new_edge(test_vertex_b)
test_vertex_a.add_new_edge(test_vertex_c)
test_vertex_a.add_new_edge(test_vertex_g)
test_vertex_b.add_new_edge(test_vertex_e)
test_vertex_b.add_new_edge(test_vertex_d)
test_vertex_c.add_new_edge(test_vertex_d)
test_vertex_d.add_new_edge(test_vertex_e)
test_vertex_d.add_new_edge(test_vertex_f)
test_vertex_f.add_new_edge(test_vertex_g)


test_graph_2 = AdjacencyListGraph.new

test_vertex_2_a = test_graph_2.add_vertex("A")
test_vertex_2_b = test_graph_2.add_vertex("B")
test_vertex_2_c = test_graph_2.add_vertex("C")
test_vertex_2_d = test_graph_2.add_vertex("D")
test_vertex_2_e = test_graph_2.add_vertex("E")

test_vertex_2_a.add_new_edge(test_vertex_2_b)
test_vertex_2_a.add_new_edge(test_vertex_2_c)
test_vertex_2_b.add_new_edge(test_vertex_2_e)
test_vertex_2_c.add_new_edge(test_vertex_2_d)
test_vertex_2_d.add_new_edge(test_vertex_2_e)


puts "Depth_First_Search"
depth_first_search(test_vertex_a)

puts "Broken Depth First Search"
depth_first_search(test_vertex_2_a)

puts "Breadth_First_Search"
breadth_first_search(test_vertex_a)


dijkstra_test_graph = AdjacencyListGraph.new

dijkstra_test_vertex_a = dijkstra_test_graph.add_vertex("A")
dijkstra_test_vertex_b = dijkstra_test_graph.add_vertex("B")
dijkstra_test_vertex_c = dijkstra_test_graph.add_vertex("C")
dijkstra_test_vertex_d = dijkstra_test_graph.add_vertex("D")
dijkstra_test_vertex_e = dijkstra_test_graph.add_vertex("E")
dijkstra_test_vertex_f = dijkstra_test_graph.add_vertex("F")
dijkstra_test_vertex_g = dijkstra_test_graph.add_vertex("G")

dijkstra_test_vertex_a.add_new_edge(dijkstra_test_vertex_b,5)
dijkstra_test_vertex_a.add_new_edge(dijkstra_test_vertex_c,10)
dijkstra_test_vertex_b.add_new_edge(dijkstra_test_vertex_d,6)
dijkstra_test_vertex_b.add_new_edge(dijkstra_test_vertex_e,3)
dijkstra_test_vertex_d.add_new_edge(dijkstra_test_vertex_f,6)
dijkstra_test_vertex_e.add_new_edge(dijkstra_test_vertex_g,2)
dijkstra_test_vertex_e.add_new_edge(dijkstra_test_vertex_c,2)
dijkstra_test_vertex_e.add_new_edge(dijkstra_test_vertex_d,2)
dijkstra_test_vertex_g.add_new_edge(dijkstra_test_vertex_f,2)

test_dijkstra = Dijkstra.new(dijkstra_test_vertex_a)

puts "Dykstra Shortest Path: "
p test_dijkstra.shortest_path(dijkstra_test_vertex_f)
puts "Dykstra Shortest Path Distance: "
p test_dijkstra.shortest_path_distance(dijkstra_test_vertex_f)


top_sort_test_graph = AdjacencyListGraph.new

top_sort_test_vertex_a = top_sort_test_graph.add_vertex("A")
top_sort_test_vertex_b = top_sort_test_graph.add_vertex("B")
top_sort_test_vertex_c = top_sort_test_graph.add_vertex("C")
top_sort_test_vertex_d = top_sort_test_graph.add_vertex("D")
top_sort_test_vertex_e = top_sort_test_graph.add_vertex("E")

top_sort_test_vertex_a.add_new_edge(top_sort_test_vertex_b)
top_sort_test_vertex_a.add_new_edge(top_sort_test_vertex_c)
top_sort_test_vertex_b.add_new_edge(top_sort_test_vertex_d)
top_sort_test_vertex_c.add_new_edge(top_sort_test_vertex_d)
top_sort_test_vertex_d.add_new_edge(top_sort_test_vertex_e)

test_top_sort = TopologicalSort.new(top_sort_test_graph)
puts
top_sort_test_graph.vertices.each do |v|
  p v.data.to_s + ": " + v.edges.to_s unless v.edges.empty?
end
puts
puts "TopologicalSort"
puts
p test_top_sort.sorted_array
