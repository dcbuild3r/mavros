use std::field::bn254::assert_lt;

fn set_limb(row: &mut ([u128; 1],), idx: u32, value: u128) {
    row.0[idx] = value;
}

fn main(x: Field, expected: pub Field) {
    assert_lt(x, 0x1000000000000000000000000000000);

    let mut limbs: [u128; 1] = [0];
    limbs[0] = x as u128;

    let mut rows: [([u128; 1],); 1] = [([0],); 1];
    rows[0] = (limbs,);

    let mut row: ([u128; 1],) = ([0],);
    set_limb(&mut row, 0, rows[0].0[0]);

    assert(row.0[0] as Field == expected);
}
