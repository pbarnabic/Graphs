require_relative '../skeleton/adjacency_list_graph.rb'
require 'rspec'

describe "AdjacencyListGraph" do
  let(:test_graph) { AdjacencyListGraph.new }
  describe "#initialize" do
    it "should set vertices to an empty array" do
      expect(test_graph.vertices).to eq([])
    end
  end

  describe "#add_vertex" do
    it "should return the new vertex" do
      expect(test_graph.add_vertex(3)).to be_a_kind_of(Vertex)
    end
    it "should add the new vertex to the graph's vertices array" do
      test_graph.add_vertex(3)
      expect(test_graph.vertices.length).to eq(1)
    end
  end
end

describe "Vertex" do
  describe "#initialize" do
    subject(:test_vertex){ Vertex.new }
    it "should set data to nil if no data is passed in" do
      expect(test_vertex.data).to be(nil)
    end

    let(:test_vertex_with_data){ Vertex.new(1) }

    it "should set data to the value passed in" do
      expect(test_vertex_with_data.data).to be(1)
    end
    it "should set the edges to an empty array" do
      expect(test_vertex_with_data.edges).to eq([])
    end
  end

  describe "#add_new_edge" do
    let(:test_vertex){ Vertex.new }
    let(:test_vertex_2){ Vertex.new }
    it "should add a new edge to the edges array" do
      test_vertex.add_new_edge(test_vertex_2)
      expect(test_vertex.edges.length).to eq (1)
    end
  end
end

describe "Edge" do
  describe "#initialize" do
    let(:start_vertex){ Vertex.new(1) }
    let(:end_vertex){ Vertex.new(2) }
    let (:test_edge){Edge.new(start_vertex,end_vertex, 2)}
    it "should accept a start vertex and end vertex as arguments" do
      expect{Edge.new(start_vertex,end_vertex)}.not_to raise_error
    end
    it "should accept a start vertex, end vertex, and weight as arguments" do
      expect{Edge.new(start_vertex,end_vertex,1)}.not_to raise_error
    end
    it "should store the start vertex" do
      expect(test_edge.start_vertex).to eq (start_vertex)
    end
    it "should store the end vertex" do
      expect(test_edge.end_vertex).to eq (end_vertex)
    end
    it "should store the weight" do
      expect(test_edge.weight).to eq (2)
    end
  end

end
