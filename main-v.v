import time

fn main() {
	maxnum := 100000000
	mut rawbits := []bool{len: int((maxnum + 1) /2), init: true}

	sq := time.new_stopwatch({})
	for facter in 3..maxnum {
		if get_odd(facter, rawbits) {
			remove_bits(facter, mut rawbits, maxnum)
		}
	}
	mut count := 0
	for bit in rawbits {
		if bit {
			count ++
		}
	}
	println(count)
	println('Fount ${count} prime numbers in ${sq.elapsed().seconds()}seconds')


}
fn remove_bit(index int,mut rawbits []bool) {
	rawbits[int(index / 2)] = false
}

fn remove_bits(facter int, mut rawbits []bool, maxnum int) {
	for number := facter * 3; number < maxnum; number += facter * 2 {
		remove_bit(number, mut rawbits)
	}
}

fn get_odd(number int, rawbits []bool) bool {
	if number % 2 == 0 {
		return false
	}
	else {
		return rawbits[int(number /2)]
	}
}
