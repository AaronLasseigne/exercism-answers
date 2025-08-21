pub fn is_valid(code: &str) -> bool {
    let code = code.replace(" ", "");

    if code.len() <= 1 || !code.chars().all(char::is_numeric) {
        return false;
    }

    let result: u32 = code
        .chars()
        .map(|ch| ch.to_digit(10).unwrap())
        .rev()
        .enumerate()
        .map(|(i, digit)| {
            if i % 2 != 0 {
                let result = digit * 2;
                if result > 9 {
                    result - 9
                } else {
                    result
                }
            } else {
                digit
            }
        })
        .sum();

    result % 10 == 0
}
