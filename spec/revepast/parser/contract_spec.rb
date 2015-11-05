require 'spec_helper'

RSpec.describe Revepast::Parser::Contract do

  let(:asset_list) {
"Rokh\t1\tBattleship\tShip\t
Rokh\t1\tBattleship\tShip\t
 Large Core Defense Field Extender I\t1\tRig Shield\tModule\tFitted
Rokh\t1\tBattleship\tShip\t
 Large Core Defense Field Extender I\t1\tRig Shield\tModule\tFitted
 Scorch M\t1\tAdvanced Pulse Laser Crystal\tCharge\tFitted 72% damaged
 Scorch L\t2\tAdvanced Pulse Laser Crystal\tCharge\t 1% damaged
 Scorch L\t2\tAdvanced Pulse Laser Crystal\tCharge\t 1% damaged
Armageddon Blueprint\t1\tBattleship Blueprint\tBlueprint\tBLUEPRINT COPY - \
 Runs: 9 - Material Level: 29 - Productivity Level: 0
425mm Railgun I\t2000\tHybrid Weapon
Rokh\t12'000\tBattleship\tShip\t
"
  }
  let(:invalid_asset) { "Rokh" }

  it "parses assets in contracts" do
    test = Revepast::Parse.new(asset_list)
    result = test.result

    expect(result[0]).to eq("Contract")
    # expect(result[1].size).to eq(asset_list.split("\n").size)
    # expect(result[2].size).to eq(0)
  end

end
