#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
    if a == b {
        return Comparison::Equal;
    };

    if a.len() < b.len() {
        if contains(a, b) {
            return Comparison::Sublist;
        }
    } else if b.len() < a.len() {
        if contains(b, a) {
            return Comparison::Superlist;
        }
    }

    Comparison::Unequal
}

fn contains<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    a.is_empty() || b.windows(a.len()).any(|slice| slice == a)
}
