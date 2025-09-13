use std::cmp::Ordering;

pub fn find<U: AsRef<[T]>, T: Ord>(array: U, key: T) -> Option<usize> {
    let array = array.as_ref();

    if array.is_empty() {
        return None;
    }

    let midpoint = (array.len() - 1) / 2;
    match key.cmp(&array[midpoint]) {
        Ordering::Equal => Some(midpoint),
        Ordering::Greater => {
            let after = midpoint + 1;
            match find(&array[after..], key) {
                Some(index) => Some(after + index),
                None => None
            }
        },
        Ordering::Less => find(&array[..midpoint], key)
    }
}
