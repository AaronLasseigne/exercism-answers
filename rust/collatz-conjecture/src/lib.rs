pub fn collatz(n: u64) -> Option<u64> {
    let mut n = n;
    let mut steps = 0;

    loop {
        match n {
            0 => return None,
            1 => return Some(steps),
            _ => {
                n =
                    if n % 2 == 0 {
                        n / 2
                    } else {
                        (n * 3) + 1
                    };
                steps += 1;
            }
        }
    }
}
