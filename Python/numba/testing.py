from utility import timeResults, validate
from eratosthenes import run_sieve


passes = 0

# start_time = timeResults()
# pp.reset()
# pp.my_version()

# time = timeResults(start_time)
# print(len(pp.primeNumbers))
# print(
#     f"Got result in {time}seconds and it was {validate(pp.maxNum, len(pp.primeNumbers))}."
# )


def run_repeat():
    max_nums = [100, 1000, 10_000, 100_000]
    for number in max_nums:
        pp.maxNum = number
        print(f"Run test for {number}")

        pp.timeResults()
        pp.my_version()
        time = pp.timeResults()

        print(
            f"Got result in {time}seconds and found {len(pp.primeNumbers)} prime numbers and that is {validate(pp.maxNum, len(pp.primeNumbers))}."
        )


def run_loops():
    count = 0
    start_time = timeResults()
    maxNum = 1_000_000
    while timeResults(start_time) < 5:
        count += 1
        if run_sieve(maxNum):
            pass
        else:
            print("Run failed")

    print(f"Ran checker {count} times")


# pp.run_repeat()

# erato = Eulers(10_000_000)
# start_time = timeResults()
# erato.run()
# time = timeResults(start_time)
# print(erato.countPrimes())
# print(
#     f"Got results in {time} seconds and it was {validate(erato.maxNum, erato.countPrimes())}"
# )

run_loops()