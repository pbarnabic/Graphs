require_relative '../skeleton/dijkstra/dijkstra'
require_relative '../skeleton/adjacency_list_graph'
require 'rspec'

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


describe "Dijkstra" do
  describe "#shortest_path" do
    let(:test_vertex_a) {dijkstra_test_vertex_a}
    let(:test_vertex_f) {dijkstra_test_vertex_f}
    let(:test_vertex_b) {dijkstra_test_vertex_b}
    let(:test_dijkstra){ Dijkstra.new(test_vertex_a) }
    it "should return the correct shortest path" do
      expect(test_dijkstra.shortest_path(test_vertex_b)).to eq("A --> B")
      expect(test_dijkstra.shortest_path(test_vertex_f)).to eq("A --> B --> E --> G --> F")
      expect(test_dijkstra.shortest_path(test_vertex_a)).to eq("A")
    end
  end
  describe "#shortest_path_distance" do
    let(:test_vertex_a) {dijkstra_test_vertex_a}
    let(:test_vertex_f) {dijkstra_test_vertex_f}
    let(:test_vertex_b) {dijkstra_test_vertex_b}
    let(:test_dijkstra){ Dijkstra.new(test_vertex_a) }
    it "should return the correct shortest path distance" do
      expect(test_dijkstra.shortest_path_distance(test_vertex_b)).to eq(5)
      expect(test_dijkstra.shortest_path_distance(test_vertex_f)).to eq(12)
      expect(test_dijkstra.shortest_path_distance(test_vertex_a)).to eq(0)
    end
  end

end
