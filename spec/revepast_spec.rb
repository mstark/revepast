require 'revepast'

RSpec.describe Revepast do
	it "Parse an EFT file" do
		str = "[Cynabal, ICE Cynaballs]
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

425mm AutoCannon II, Republic Fleet EMP M
425mm AutoCannon II, Republic Fleet EMP M
425mm AutoCannon II
425mm AutoCannon II, Republic Fleet EMP M
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
Nanite Repair Paste x600"
		revepast = Revepast::Parse.new(str)
	end

	# it "Parse listing including a cargo scan results and normal human-readable lists" do
	# 	str2 = "10 x Cargo Scanner II"
	# 	revepast2 = Revepast::Parse.new(str2)
	# 	str3 = "10x Cargo Scanner II"
	# 	revepast3 = Revepast::Parse.new(str3)
	# 	str4 = "10 Cargo Scanner II"
	# 	revepast4 = Revepast::Parse.new(str4)
	# end
end