import time
import math

fn main() {
	sw := time.new_stopwatch({})
	mut count := 0
	mut result_recive := 0
	for {
		result_recive = run(1_000_000)
		count ++
		if sw.elapsed().seconds() > 5 {
			break
		}
	}
	println(count)
	println(result_recive)



	list_of_nums := [1000, 10000, 100000, 1000000, 10_000_000, 100_000_000]

	for number in list_of_nums {
		sw1 := time.new_stopwatch({})
		result := run(number)
		println("Got ${result} results in ${sw1.elapsed().seconds()}")
	}
}

fn run(maxnum int) int {
	mut rawbits := []bool{len: int((maxnum + 1) / 2),init: true}
	mut count := 0

	get_odd := fn (number int, rawbit bool) bool {
		if number % 2 == 0 {
			return false
		}
		else {
			return rawbit
		}
	}

	for facter := 3; facter < math.sqrt(maxnum); facter += 2 {
		for num := facter; num < maxnum; num += 2 {
			if get_odd(num, rawbits[num / 2]) {
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
