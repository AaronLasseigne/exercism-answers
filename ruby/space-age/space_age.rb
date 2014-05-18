class SpaceAge
  EARTH_YEAR = 31_557_600.0
  private_constant :EARTH_YEAR

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    to_years
  end

  def on_mercury
    to_years(0.2408467)
  end

  def on_venus
    to_years(0.61519726)
  end

  def on_mars
    to_years(1.8808158)
  end

  def on_jupiter
    to_years(11.862615)
  end

  def on_saturn
    to_years(29.447498)
  end

  def on_uranus
    to_years(84.016846)
  end

  def on_neptune
    to_years(164.79132)
  end

  private def to_years(orbital_ratio = 1)
    (seconds / (EARTH_YEAR * orbital_ratio)).round(2)
  end
end
