require 'spec_helper'

include WireMind

describe Instruction do

  let(:context) { Hash.new }
  let(:owner)   { Hash.new }

  let(:memory)  { Memory.new }

  before { memory[4] = :junk }

  describe "IN" do

    it "gets input from context" do
      context["foo"] = 10
      owner["foo"]   = 20

      Instruction.in(context, owner, memory, "foo", 4)

      memory[4].must_equal 10
    end

  end

  describe "OUT" do

    it "sets context from memory" do
      memory[4] = 12

      Instruction.out(context, owner, memory, "foo", 4)

      context["foo"].must_equal 12
      owner["foo"].wont_equal 12
    end

  end

  describe "GET" do

    it "gets input from owner" do
      context["foo"] = 10
      owner["foo"]   = 20

      Instruction.get(context, owner, memory, "foo", 4)

      memory[4].must_equal 20
    end

  end

  describe "SET" do

    it "sets context from memory" do
      memory[4] = 12

      Instruction.set(context, owner, memory, "foo", 4)

      context["foo"].wont_equal 12
      owner["foo"].must_equal 12
    end

  end

  describe "ANY" do

    it "signals 1 if all inputs are 1" do
      memory[1] = 1
      memory[2] = 1
      memory[3] = 1

      Instruction.any(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 1
    end

    it "signals 1 if a single input is 1" do
      memory[1] = 1

      Instruction.any(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 1
    end

    it "signals 0 if every input is 0" do
      Instruction.any(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 0
    end

  end

  describe "ALL" do

    it "signals 1 if all inputs are 1" do
      memory[1] = 1
      memory[2] = 1
      memory[3] = 1

      Instruction.all(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 1
    end

    it "signals 0 if a single input isn't 1" do
      memory[1] = 1
      memory[2] = 1

      Instruction.all(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 0
    end

    it "signals 0 if every input is 0" do
      Instruction.all(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 0
    end

  end

  describe "NONE" do

    it "signals 0 if all inputs are 1" do
      memory[1] = 1
      memory[2] = 1
      memory[3] = 1

      Instruction.none(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 0
    end

    it "signals 0 if a single input is 1" do
      memory[1] = 1

      Instruction.none(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 0
    end

    it "signals 1 if every input is 0" do
      Instruction.none(context, owner, memory, [1, 2, 3], 4)

      memory[4].must_equal 1
    end

  end

end
