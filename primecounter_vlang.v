import time
import math

fn main() {
	sw := time.new_stopwatch({})
	mut results := []int{}
	for {
		results << run(1000000)
		if sw.elapsed().seconds() > 5 {
			break
		}
	}
	println(results.len)



	list_of_nums := [1000, 10000, 100000, 1000000, 10_000_000, 100_000_000]

	for number in list_of_nums {
		sw1 := time.new_stopwatch({})
		result := run(number)
		println("Got ${result} results in ${sw1.elapsed().seconds()}")
	}
}

fn run(maxnum int) int {
	mut rawbits := []bool{len: int((maxnum + 1) /2), init: true}
	mut count := 0

	for facter := 3; facter < math.sqrt(maxnum); facter += 2 {
		for num in facter..maxnum {
			if get_odd(num, rawbits) {
				facter = num
				break
			}
		}
		for number := facter * 3; number < maxnum; number += facter * 2 {
			rawbits[int(number /2)] = false
		}

	}
	for bit in rawbits {
		if bit {
			count ++
		}
	}

	return count
}

fn get_odd(number int, rawbits []bool) bool {
	if number % 2 == 0 {
		return false
	}
	else {
		return rawbits[int(number /2)]
	}
}
