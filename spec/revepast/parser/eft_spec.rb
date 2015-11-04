require 'spec_helper'

RSpec.describe Revepast::Parser::EFT do

  let(:cynabal_eft_fit) {
"[Cynabal, ICE Cynaballs]
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
  }

  describe "eft" do
    it "parses eft format" do
      assets = Revepast::Parse.new(cynabal_eft_fit)
      result = assets.result

      expect(result[0]).to eq("EFT")
      expect(result[1].size).to eq(3) # ship, name, modules
      expect(result.last.size).to eq(0)
    end
  end

end
