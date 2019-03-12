require_relative '../skeleton/adjacency_matrix_graph.rb'
require 'rspec'

describe "AdjacencyMatrixGraph" do
  describe "#initialize" do
    let(:test_graph) { AdjacencyMatrixGraph.new }
    let(:test_graph_1) { AdjacencyMatrixGraph.new(2)}
    it "should create a two dimensional array of default size 1 x 1" do
      expect(test_graph.matrix.length).to eq(1)
      expect(test_graph.matrix[0].length).to eq(1)
    end
    it "should create a two dimensional array of the size specified" do
      expect(test_graph_1.matrix.length).to eq(2)
      expect(test_graph_1.matrix[0].length).to eq(2)
    end
  end

  describe "#add_edge" do
    let(:test_graph) { AdjacencyMatrixGraph.new(2)}
    it "should set the value at the indices specified equal to true" do
      test_graph.add_edge(1,1)
      expect(test_graph.matrix[1][1]).to eq(true)
      expect(test_graph.matrix[0][0]).to eq(false)
    end

    it "should set the default value of a coordinate to false" do
      expect(test_graph.matrix[0][0]).to eq(false)
    end
  end
end
