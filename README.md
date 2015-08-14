[![Gem Version](https://badge.fury.io/rb/revepast.png)](http://badge.fury.io/rb/revepast)
[![Coverage Status](https://coveralls.io/repos/IceProd/revepast/badge.svg?branch=master&service=github)](https://coveralls.io/github/IceProd/revepast?branch=master)
[![Build Status](https://travis-ci.org/IceProd/revepast.svg?branch=master)](https://travis-ci.org/IceProd/revepast)
[![security](https://hakiri.io/github/IceProd/revepast/master.svg)](https://hakiri.io/github/IceProd/revepast/master)

# Revepast

A ruby library to help parse various things that are copy/pastable from the Eve Online UI.
Largely inspired from [Evepaste](https://github.com/evepraisal/evepaste).

This is currently a **work in progress**. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'revepast'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install revepast


## Tests
```ruby
RSpec.describe Revepast do
	it "Parse an EFT file" do
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
```

Result 
```ruby
[
  "EFT",
  {
    "ship": "Cynabal",
    "name": "ICE Cynaballs",
    "modules": [
      {
        "name": "Hornet II",
        "quantity": 5
      },
      {
        "name": "Hornet EC-300",
        "quantity": 5
      },
      {
        "name": "Republic Fleet Fusion M",
        "quantity": 1000
      },
      {
        "name": "Republic Fleet Phased Plasma M",
        "quantity": 1500
      },
      {
        "name": "Republic Fleet EMP M",
        "quantity": 1500
      },
      {
        "name": "Barrage M",
        "quantity": 600
      },
      {
        "name": "Nanite Repair Paste",
        "quantity": 600
      },
      {
        "name": "Gyrostabilizer II",
        "quantity": 2
      },
      {
        "name": "Tracking Enhancer II",
        "quantity": 2
      },
      {
        "name": "Nanofiber Internal Structure II",
        "quantity": 1
      },
      {
        "name": "Adaptive Invulnerability Field II",
        "quantity": 1
      },
      {
        "name": "50MN Cold-Gas Enduring Microwarpdrive",
        "quantity": 1
      },
      {
        "name": "Large Shield Extender II",
        "quantity": 2
      },
      {
        "name": "Warp Disruptor II",
        "quantity": 1
      },
      {
        "name": "425mm AutoCannon II",
        "quantity": 4
      },
      {
        "name": "Medium Energy Neutralizer II",
        "quantity": 1
      },
      {
        "name": "Medium Anti-EM Screen Reinforcer I",
        "quantity": 1
      },
      {
        "name": "Medium Core Defense Field Extender I",
        "quantity": 2
      }
    ]
  },
  [

  ]
]

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## CCP Copyright Notice

EVE Online and the EVE logo are the registered trademarks of CCP hf. All rights are reserved worldwide. All other trademarks are the property of their respective owners. EVE Online, the EVE logo, EVE and all associated logos and designs are the intellectual property of CCP hf. All artwork, screenshots, characters, vehicles, storylines, world facts or other recognizable features of the intellectual property relating to these trademarks are likewise the intellectual property of CCP hf. CCP hf. has granted permission to evepaste to use EVE Online and all associated logos and designs for promotional and information purposes on its website but does not endorse, and is not in any way affiliated with, evepaste. CCP is in no way responsible for the content on or functioning of this website, nor can it be liable for any damage arising from the use of this website.
