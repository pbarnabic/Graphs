require_relative '../skeleton/topological_sort'
require_relative '../skeleton/adjacency_list_graph'
require 'rspec'


top_sort_test_graph = AdjacencyListGraph.new

top_sort_test_vertex_a = top_sort_test_graph.add_vertex("Get Tobacco")
top_sort_test_vertex_b = top_sort_test_graph.add_vertex("Break up the Tobacco")
top_sort_test_vertex_c = top_sort_test_graph.add_vertex("Roll a Filter")
top_sort_test_vertex_d = top_sort_test_graph.add_vertex("Roll it up")
top_sort_test_vertex_e = top_sort_test_graph.add_vertex("Set it on fire")

top_sort_test_vertex_a.add_new_edge(top_sort_test_vertex_b)
top_sort_test_vertex_a.add_new_edge(top_sort_test_vertex_c)
top_sort_test_vertex_b.add_new_edge(top_sort_test_vertex_d)
top_sort_test_vertex_c.add_new_edge(top_sort_test_vertex_d)
top_sort_test_vertex_d.add_new_edge(top_sort_test_vertex_e)

test_top_sort = TopologicalSort.new(top_sort_test_graph)

describe "TopologicalSort" do
    let(:topological_sort_test){test_top_sort}
    it "should return items in the appropriate order" do
      expect(topological_sort_test.sorted_array.to_s).to eq("[Data: Get Tobacco, Data: Roll a Filter, Data: Break up the Tobacco, Data: Roll it up, Data: Set it on fire]")
    end
end
