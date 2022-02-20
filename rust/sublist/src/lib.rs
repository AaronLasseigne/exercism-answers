#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list == _second_list {
        return Comparison::Equal;
    };

    if _first_list.len() < _second_list.len() {
        if is_sublist(_first_list, _second_list) {
            return Comparison::Sublist;
        }
    } else if _second_list.len() < _first_list.len() {
        if is_sublist(_second_list, _first_list) {
            return Comparison::Superlist;
        }
    }

    Comparison::Unequal
}

fn is_sublist<T: PartialEq>(_list: &[T], _super_list: &[T]) -> bool {
    if _list == &_super_list[0..(_list.len())] {
        return true
    };

    if _list.len() >= _super_list.len() {
        return false;
    }

    is_sublist(_list, &_super_list[1..(_super_list.len())])
}
