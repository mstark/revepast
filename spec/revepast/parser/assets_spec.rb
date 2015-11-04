require 'spec_helper'

RSpec.describe Revepast::Parser::Assets do

  let(:asset_list) {
"Hurricane\t1\tCombat Battlecruiser\t\t\t15,000 m3
720mm Gallium Cannon\t1\tProjectile Weapon\tMedium\tHigh\t10 m3
Damage Control II\t1\tDamage Control\t\tLow\t5 m3
Experimental 10MN Microwarpdrive I\t1\tPropulsion Module\t\tMedium\t10 m3
200mm AutoCannon I\t1\tProjectile Weapon\tModule\tSmall\tHigh\t5 m3\t\t1
10MN Afterburner II\t1\tPropulsion Module\tModule\t\tMedium\t5 m3\t5\t2
Warrior II\t9
hurricane\t20
Sleeper Data Library\t1\xc2\xa0080\tSleeper Components\t\t\t10.80 m3
Sleeper Data Library\t1.080\tSleeper Components\t\t\t10.80 m3
Amarr Dreadnought\t1\tSpaceship Command\tSkill\t\t\t0.01 m3\t\t
Quafe Zero\t12\tBooster\tImplant\t\t1 \t12 m3\t\t
Sleeper Data Library\t1,080\tSleeper Components\t\t\t10.80 m3
Antimatter Charge M\t100\xc2\xa0000\tHybrid Charge\tMedium\t\t\
1\xc2\xa0250 m3
Hurricane\t12'000\tCombat Battlecruiser\t\t\t15,000 m3
"
  }

  describe "assets" do
    it "parses assets list" do
      assets = Revepast::Parse.new(asset_list)
      result = assets.result

      expect(result[0]).to eq("Assets")
      expect(result[1].size).to eq(asset_list.split("\n").size)
      expect(result[2].size).to eq(0)
    end
  end


end
