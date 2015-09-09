-module(space_age).
-export([ageOn/2]).

ageOn(Planet, Seconds) ->
  EarthPeriod = 31557600,
  PeriodMultipliers = #{
    earth => 1,
    mercury => 0.2408467,
    venus => 0.61519726,
    mars => 1.8808158,
    jupiter => 11.862615,
    saturn => 29.447498,
    uranus => 84.016846,
    neptune => 164.79132
  },
  Periods = maps:map(fun(_,V) -> EarthPeriod * V end, PeriodMultipliers),
  Seconds*1.0/maps:get(Planet,Periods).
