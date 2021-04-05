from math import sqrt
from numba import jit


@jit
def run_sieve(maxNum):
    facter = 3
    q = sqrt(maxNum)
    rawbits = [True] * int((maxNum + 1) / 2)

    while facter < q:
        for num in range(facter, maxNum):
            if num % 2 != 0 and rawbits[int(num / 2)]:
                facter = num
                break

        for num in range(facter * 3, maxNum, facter * 2):
            rawbits[int(num / 2)] = False
        facter += 2

    count = 0
    for bit in rawbits:
        if bit:
            count += 1
    if count == 78_498:
        return True
    else:
        return False