pub fn annotate(garden: &[&str]) -> Vec<String> {
    garden.iter()
        .enumerate()
        .map(|(row_index, row)| {
            row
                .as_bytes()
                .iter()
                .enumerate()
                .map(|(col_index, square)| {
                    match square {
                        b'*' => "*".to_string(),
                        b' ' => flower_count(garden, row_index, col_index),
                        unknown => panic!("unknown square type: {}", *unknown as char)
                    }
                })
                .collect()
        })
        .collect()
}

fn flower_count(garden: &[&str], row_index: usize, col_index: usize) -> String {
    let mut squares = String::new();

    let col_start_index: usize = if col_index > 0 { col_index - 1 } else { col_index };
    let col_end_index: usize = (col_index + 1).clamp(0, garden[0].len() - 1);

    if row_index > 0 {
        let row = garden[row_index - 1];
        squares.push_str(&row[col_start_index..=col_end_index]);
    }

    let row = garden[row_index];
    squares.push_str(&row[col_start_index..=col_end_index]);

    if row_index < garden.len() - 1 {
        let row = garden[row_index + 1];
        squares.push_str(&row[col_start_index..=col_end_index]);
    }

    let count = squares.as_bytes().iter().filter(|square| **square == b'*').count();
    if count == 0 { " ".to_string() } else { count.to_string() }
}
