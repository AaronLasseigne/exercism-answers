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
        if is_sublist(a, b) {
            return Comparison::Sublist;
        }
    } else if b.len() < a.len() {
        if is_sublist(b, a) {
            return Comparison::Superlist;
        }
    }

    Comparison::Unequal
}

fn is_sublist<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    if a.len() == 0 { return true; }

    b.windows(a.len()).any(|slice| slice == a)
}
