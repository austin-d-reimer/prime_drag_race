package main

import (
	"fmt"
	"math"
	"time"
)

func run(maxnum int) int {
	rawbits := make([]bool, int((maxnum+1)/2))
	count := 0

	for facter := 3; facter < int(math.Sqrt(float64(maxnum))+1); facter += 2 {
		for num := facter; num < maxnum; num += 2 {
			if num%2 != 0 && rawbits[int(num/2)] == false {
				facter = num
				break
			}
		}

		for number := facter * 3; number < maxnum; number += facter * 2 {
			rawbits[int(number/2)] = true
		}
	}

	for i := 0; i < len(rawbits); i++ {
		if !rawbits[i] {
			count++
		}
	}
	return count
}

func run_loop() {
	max_numbers := []int{1_000, 10_000, 100_000, 1_000_000, 10_000_000, 100_000_000}

	for i := range max_numbers {
		starttime := time.Now()
		fmt.Println(run(max_numbers[i]))
		fmt.Println(time.Duration(starttime.Nanosecond()))
	}
}

func run_timed() {
	starttime := time.Now()
	count := 0
	result := 0
	for {
		result = run(1_000_000)
		count++
		if result != 78_498 {
			fmt.Println(result, " Is not correct")
		}
		if time.Now().Second()-starttime.Second() > 5 {
			break
		}
	}
	fmt.Println("Ran ", count, " times in 5 seconds their was ", result, "results")
}

func main() {
	run_timed()
	// fmt.Println(run(1000))

}
