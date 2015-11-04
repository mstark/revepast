require 'spec_helper'

RSpec.describe Revepast::Parser::CargoScan do

  let(:array) {
    [
      Revepast::Parse.new('10 x Cargo Scanner II'),
      Revepast::Parse.new('10x Cargo Scanner II'),
      Revepast::Parse.new('10 Cargo Scanner II'),
      Revepast::Parse.new('Cargo Scanner II x10'),
      Revepast::Parse.new('Cargo Scanner I x 10'),
      Revepast::Parse.new('Cargo Scanner II 10'),
      Revepast::Parse.new('Cargo Scanner II'),
    ]
  }

  it 'parses listing including a cargo scan results and normal human-readable lists' do
    skip('pending')
    array.each do |test|
      expect(test.result).to eq()
    end
  end
end
