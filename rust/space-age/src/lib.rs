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

    fn seconds_per_year() -> f64;

    fn years_during(duration: &Duration) -> f64 {
        duration.seconds as f64 / Self::seconds_per_year()
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 0.2408467
    }
}
impl Planet for Venus {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 0.61519726
    }
}
impl Planet for Earth {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR
    }
}
impl Planet for Mars {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 1.8808158
    }
}
impl Planet for Jupiter {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 11.862615
    }
}
impl Planet for Saturn {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 29.447498
    }
}
impl Planet for Uranus {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 84.016846
    }
}
impl Planet for Neptune {
    fn seconds_per_year() -> f64 {
        Self::SECONDS_PER_EARTH_YEAR * 164.79132
    }
}
