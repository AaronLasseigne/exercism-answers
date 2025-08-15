use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let lowercase_word = word.to_lowercase();
    let normalized_word = normalized_anagram(&word);

    possible_anagrams
        .iter()
        .filter(|anagram| {
            anagram.to_lowercase() != lowercase_word && normalized_anagram(anagram) == normalized_word
        })
        .copied()
        .collect()
}

fn normalized_anagram(anagram: &str) -> Vec<char> {
    let mut letters = anagram.to_lowercase().chars().collect::<Vec<char>>();
    letters.sort();
    letters
}
