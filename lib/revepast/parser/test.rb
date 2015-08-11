# /usr/bin/ruby

input = {
"425mm AutoCannon II, Republic Fleet EMP M" => 3
}

expected_output = [
{
name: "425mm AutoCannon II",
ammo: "Republic Fleet EMP M",
quantity: 3
}
]

output = input.inject([]) do |memo, (key, quantity)|
name, ammo = key.split(",")
memo << { name: name.strip, ammo: ammo.strip, quantity: quantity }
p memo
end

raise "don't match" if output != expected_output