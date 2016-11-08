Notes from Co-Working on Petsy & API


<ActiveShipping::package:0x007fa352963f28

 - @currency=nil,
 - @cylinder=false,
 - @dimensions=
  [#<Quantified::Length: 4.5 inches>,
   #<Quantified::Length: 10 inches>,
   #<Quantified::Length: 15 inches>],
 - @dimensions_unit_system=:imperial,
 - @gift=false,
 - @options={:units=>:imperial},
 - @oversized=false,
- @unpackaged=false,
- @value=nil,
- @weight=#<Quantified::Mass: 120.0 ounces>,
- @weight_unit_system=:imperial>]

packages =
origin =
destination =


ups = ActiveShipping::Ups.new(login: "", password: "secret", key: "")
response = ups.find_rates(origin, destination, packages)




<!-- => [#<ActiveShipping::package:0x007fa352963f28 @options={:units=>:imperial},
@dimensions=[#<Quantified::Length: 4.5 inches>, #<Quantified::Length: 10 inches>,
#<Quantified::Length: 15 inches>],
@weight_unit_system=:imperial,
@dimensions_unit_system=:imperial,
@weight=#<Quantified::Mass: 120.0 ounces>,
@value=nil,
@currency=nil,
@cylinder=false,
@gift=false,
@oversized=false,
@unpackaged=false>] -->
