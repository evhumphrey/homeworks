require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Bob the Great") }
  subject(:cake) { Dessert.new("cake", 20, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "20", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("chocolate")
      expect(cake.ingredients).to eq(["chocolate"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("chocolate")
      cake.add_ingredient("vanilla")
      cake.add_ingredient("flour")
      cake.add_ingredient("sugar")
      cake.add_ingredient("egg")
      pre_mix = cake.ingredients.dup
      cake.mix!
      expect(pre_mix).to_not eq(cake.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(21) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to eq("#{chef.titleize} has made #{cake.quantity} #{cake.type.pluralize}!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
