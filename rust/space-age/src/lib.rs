#[derive(Debug)]
pub struct Duration {
    seconds: u64
}

impl From<u64> for Duration {
    fn from(seconds: u64) -> Self {
        Self { seconds }
    }
}

pub trait Planet {
    const SECONDS_PER_EARTH_YEAR: f64 = 31_557_600.0;
    const PERIOD: f64;

    fn years_during(duration: &Duration) -> f64 {
        duration.seconds as f64 / (Self::SECONDS_PER_EARTH_YEAR * Self::PERIOD)
    }
}

macro_rules! planet {
    ( $name:ident, $period:literal ) => {
        pub struct $name;

        impl Planet for $name {
            const PERIOD: f64 = $period;
        }
    }
}

planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Earth, 1.0);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);
