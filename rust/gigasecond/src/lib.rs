use time::PrimitiveDateTime as DateTime;
use time::ext::NumericalDuration;
use std::ops::Add;

const GIGA: i64 = 1_000_000_000;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    start.add(GIGA.seconds())
}
