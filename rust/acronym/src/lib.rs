pub fn abbreviate(phrase: &str) -> String {
    let phrase = &phrase
        .replace("-", " ")
        .replace(|x: char| { !(x == ' ' || x.is_alphabetic()) }, "");

    phrase
        .split(" ")
        .flat_map(|word| {
            let uppercase_letters: Vec<char> = word
                .chars()
                .filter(|ch| ch.is_uppercase())
                .collect();

            if word.to_uppercase() == word || uppercase_letters.len() == 0 {
                match word.to_uppercase().chars().next() {
                    Some(letter) => vec![letter],
                    None => Vec::new()
                }
            } else {
                uppercase_letters
            }
        })
        .collect::<String>()
}
