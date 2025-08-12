const PLANTS_PER_STUDENT: usize = 2;

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let index = seat_index(&student) * PLANTS_PER_STUDENT;

    diagram
        .lines()
        .flat_map(|line|
            line
                .chars()
                .skip(index)
                .take(PLANTS_PER_STUDENT)
                .map(|ch| plant_name(&ch))
        )
        .collect()
}

fn seat_index(student: &str) -> usize {
    match student {
        "Alice"   => 0,
        "Bob"     => 1,
        "Charlie" => 2,
        "David"   => 3,
        "Eve"     => 4,
        "Fred"    => 5,
        "Ginny"   => 6,
        "Harriet" => 7,
        "Ileana"  => 8,
        "Joseph"  => 9,
        "Kincaid" => 10,
        "Larry"   => 11,
        _ => panic!("unknown student: {}", student)
    }
}

fn plant_name(abbr: &char) -> &'static str {
    match abbr {
        'G' => "grass",
        'C' => "clover",
        'R' => "radishes",
        'V' => "violets",
        _ => panic!("unknown plant abbreviation: {}", abbr)
    }
}
