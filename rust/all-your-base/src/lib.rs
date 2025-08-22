#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(u32),
}

const MIN_BASE: u32 = 2;

pub fn convert(number: &[u32], from_base: u32, to_base: u32) -> Result<Vec<u32>, Error> {
    if from_base < MIN_BASE { return Err(Error::InvalidInputBase); }
    if to_base < MIN_BASE { return Err(Error::InvalidOutputBase); }
    if let Some(digit) = number.iter().find(|digit| **digit >= from_base) {
        return Err(Error::InvalidDigit(*digit));
    }

    let mut base_10:u32 = number
        .iter()
        .rev()
        .enumerate()
        .map(|(i, digit)| digit * from_base.pow(i as u32))
        .sum();

    let mut result:Vec<u32> = Vec::new();
    while base_10 > 0 {
        result.insert(0, base_10 % to_base);
        base_10 /= to_base;
    }

    if result.is_empty() {
        result.push(0);
    }

    Ok(result)
}
