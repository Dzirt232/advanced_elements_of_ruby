require './my_enumerable'

describe "my_select" do
  it "select all negative variables" do
    expect([1,0,-234,35,324,-2].my_select {|x| x < 0}).to eql([-234,-2])
  end

  it "select all positive variables" do
    expect([1,0,-234,35,324,-2].my_select {|x| x > 0}).to eql([1,35,324])
  end

  it "select all words with length > 3" do
    expect(["array","select","all","hi","my"].my_select {|word| word.length > 3}).to eql(["array","select"])
  end

  it "select anything" do
    expect(["all","hy","my"].my_select {|word| word.length > 3}).to eql([])
  end
end

describe "my_any" do
  context "work with block_given" do
    it "return true if one true" do
      expect([1,231,-241,2,0,2].my_any? {|x| x<0}).to eql(true)
    end

    it "return true if any true" do
      expect([1,231,-241,2,0,-2].my_any? {|x| x<0}).to eql(true)
    end

    it "return false if all false" do
      expect([1,231,241,2,0,false].my_any? {|x| if x != false && x !=true && x != nil
        x < 0
      end }).to eql(false)
    end
  end

  context "work without block_given" do
    it "return true if one true" do
      expect([false,1,false,nil].my_any?).to eql(true)
    end

    it "return true if any true" do
      expect([false,1,false,nil,2].my_any?).to eql(true)
    end

    it "return false if all false" do
      expect([false,false,false,nil,nil].my_any?).to eql(false)
    end
  end
end
