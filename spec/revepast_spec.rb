require 'revepast'
require 'coveralls'
Coveralls.wear!

RSpec.describe Revepast do
  it 'Parse an EFT file' do
    a = Revepast::Parse.new("[Cynabal, ICE Cynaballs]
Gyrostabilizer II
Gyrostabilizer II
Tracking Enhancer II
Tracking Enhancer II
Nanofiber Internal Structure II

Adaptive Invulnerability Field II
50MN Cold-Gas Enduring Microwarpdrive
Large Shield Extender II
Large Shield Extender II
Warp Disruptor II

425mm AutoCannon II
425mm AutoCannon II
425mm AutoCannon II
425mm AutoCannon II
Medium Energy Neutralizer II

Medium Anti-EM Screen Reinforcer I
Medium Core Defense Field Extender I
Medium Core Defense Field Extender I

Hornet II x5
Hornet EC-300 x5

Republic Fleet Fusion M x1000
Republic Fleet Phased Plasma M x1500
Republic Fleet EMP M x1500
Barrage M x600
Nanite Repair Paste x600
"
                           )
    puts JSON.pretty_generate(a.result)
  end

  it 'Parse listing including a cargo scan results and normal human-readable lists' do
    array = [
      Revepast::Parse.new('10 x Cargo Scanner II'),
      Revepast::Parse.new('10x Cargo Scanner II'),
      Revepast::Parse.new('10 Cargo Scanner II'),
      Revepast::Parse.new('Cargo Scanner II x10'),
      Revepast::Parse.new('Cargo Scanner I x 10'),
      Revepast::Parse.new('Cargo Scanner II 10'),
      Revepast::Parse.new('Cargo Scanner II')
    ]
    array.each do |test|
      puts JSON.pretty_generate(test.result)
    end
  end
end
