require 'spec_helper'

RSpec.describe Revepast::Parser::CargoScan do

  let(:array) {
    [
      Revepast::Parse.new('10 x Cargo Scanner II'),
      Revepast::Parse.new('10x Cargo Scanner II'),
      Revepast::Parse.new('10 Cargo Scanner II'),
      Revepast::Parse.new('Cargo Scanner II x10'),
      Revepast::Parse.new('Cargo Scanner II 10')
    ]
  }

  it 'parses listing including a cargo scan results and normal human-readable lists' do
    array.each do |test|
      expect(test.result[0]).to eq("CargoScan")
      expect(test.result[1]).to eq([{"name" => "Cargo Scanner II", "quantity" => 10}])
    end
  end

  it "works too" do
    test = Revepast::Parse.new('Cargo Scanner I x 10')
    expect(test.result[0]).to eq("CargoScan")
    expect(test.result[1]).to eq([{"name" => "Cargo Scanner I", "quantity" => 10}])
  end

  it "sets quantity to 1, when missing" do
    test = Revepast::Parse.new('Cargo Scanner II')
    expect(test.result[0]).to eq("CargoScan")
    expect(test.result[1]).to eq([{"name" => "Cargo Scanner II", "quantity" => 1}])
  end
end
