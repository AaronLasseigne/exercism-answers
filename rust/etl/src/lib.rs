use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    h.iter()
        .flat_map(|(&score, chars)| {
            chars.iter().map(move |ch| (ch.to_lowercase().next().unwrap(), score))
        })
        .collect()
}
