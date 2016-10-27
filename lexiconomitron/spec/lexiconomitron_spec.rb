require_relative "./spec_helper"
require_relative "../Lexiconomitron"

describe Lexiconomitron do 
  before :each do
  	@lexi = Lexiconomitron.new
  end
  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("Tee Day")).to eq("ee Day")
    end
  end

    describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("TtTttT Shirt")).to eq(" Shir")
    end
  end

  describe "#shazam" do
  	it "reverse each word of an array" do
  		expect(@lexi.shazam("Today hi")).to eq(["ih", "yado"])
  	end
  end

  describe "#shazam" do
  	it "reverse each word of an array" do
  		expect(@lexi.shazam("Ted hates Thai tee")).to eq(["ee", "iah", "seah", "de"])
  	end
  end

  describe "#oompa_loompa" do
  	it "take words with >4 characters" do
  		expect(@lexi.oompa_loompa("if you wanna be my lover")).to eq(["if", "you", "be", "my"])
  	end
  end

  describe "#oompa_loompa" do
  	it "take words with >4 characters" do
  		expect(@lexi.oompa_loompa("too much for Tedd")).to eq(["oo", "for", "edd"])
  	end
  end

end