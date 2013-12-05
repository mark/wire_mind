require 'spec_helper'

include WireMind

describe Memory do

  subject { WireMind::Memory.new }

  describe "getting values" do

    it "defaults to 0" do
      subject[3].must_equal 0
    end

    it "defaults to 0 even for extra cells" do
      subject[20].must_equal 0
    end

    it "fetches multiple elements at once" do
      subject[[3, 4]].must_equal [0, 0]
    end

    it "returns 0 even for extra cells" do
      subject[[23, 24]].must_equal [0, 0]
    end

  end

  describe "setting values" do

    it "stores values passed in" do
      subject[3] = 1
      subject[3].must_equal 1
    end

    it "stores values in extra cells" do
      subject[20] = 1
      subject[20].must_equal 1
    end

    it "fetches multiple elements at once" do
      subject[[3, 5]] = [1, 1]
      subject[[3, 4, 5]].must_equal [1, 0, 1]
    end

    it "returns 0 even for extra cells" do
      subject[[23, 25]] = [1, 1]
      subject[[23, 24, 25]].must_equal [1, 0, 1]
    end

  end

end
