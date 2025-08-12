struct Bracket {
    left: char,
    right: char,
}

const BRACKETS: [Bracket; 3] = [
    Bracket { left: '[', right: ']' },
    Bracket { left: '{', right: '}' },
    Bracket { left: '(', right: ')' },
];

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = Vec::new();

    for ch in string.chars() {
        if is_left(&ch) {
            stack.push(ch);
        } else if is_right(&ch) {
            match stack.pop() {
                Some(left) if is_pair(&left, &ch) => (),
                _ => return false,
            };
        }
    }

    stack.is_empty()
}

fn is_left(bracket: &char) -> bool {
    BRACKETS.map(|bracket| bracket.left).contains(bracket)
}

fn is_right(bracket: &char) -> bool {
    BRACKETS.map(|bracket| bracket.right).contains(bracket)
}

fn is_pair(left: &char, right: &char) -> bool {
    BRACKETS.into_iter().any(|bracket|
        bracket.left == *left && bracket.right == *right
    )
}
