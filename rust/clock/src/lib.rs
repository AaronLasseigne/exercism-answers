use std::fmt;

const MINUTES_PER_HOUR: i32 = 60;
const HOURS_PER_DAY: i32 = 24;
const MINUTES_PER_DAY: i32 = HOURS_PER_DAY * MINUTES_PER_HOUR;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = ((hours * MINUTES_PER_HOUR) + minutes).rem_euclid(MINUTES_PER_DAY);
        Self {
            hours: total_minutes / MINUTES_PER_HOUR,
            minutes: total_minutes % MINUTES_PER_HOUR
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(self.hours, self.minutes + minutes)
    }
}
