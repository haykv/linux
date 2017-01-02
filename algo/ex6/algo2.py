import random


def P(arr):
    n = len(arr) + 1
    A = arr
    A.insert(0, 0)  # add leading zero to match algorithm methodology [ index starts at 1 ]
    debug = 1
    # B - holds all the differences between pairs, if it's negative than zero
    B = [0 for i in range(0, n)]
    # C - holds the index of the [ Ai, Ai+1 ] pair that gave contributed to max sum
    C = [0 for i in range(0, n)]

    for i in range(1, n - 1):
        if A[i] > A[i + 1]:
            B[i] = A[i] - A[i + 1]
    # find the maximum sum sub array without adjacent cells
    # W - maximum sum in range 1..i with CELL[i]
    # WO - maximum sum in range 1..i without CELL[i]
    W = [0 for i in range(0, n)]
    WO = [0 for i in range(0, n)]

    W[1] = B[1]
    WO[1] = 0
    C[1] = 1 # C[i] holds the last cell index that contributed to max

    for i in range(2, n):

        W[i] = B[i] + WO[i - 1]
        WO[i] = max(W[i - 1], WO[i - 1])

        # current best cell index that contributed to max goes to C[i]
        if W[i] > WO[i]:
            C[i] = i
        else:
            C[i] = C[i - 1]

    # build results array - includes pairs of cells that give the best result
    result = []
    prev = C[1]
    # [Ai, Ai+1] pair C[i] holds the index i
    for i in range(2, n):
        if C[i] != prev and C[i] - 1 > 0:
            result.append([A[C[i]], A[C[i] + 1]])
        prev = C[i]  # remove duplicates

    if debug:
        print
        print 'W', W
        print 'W0', WO

        print 'A', A
        print 'B', B
        print 'C', C
        print 'MAX', max(max(W), max(WO))
        print 'PAIRS:', result

    return result, max(max(W), max(WO))


# testing
test = [12, 11, 2, 4, 1, 10, 8, 12]
P(test)
A = [i for i in range(10, 1, -1)]
P(A)
A = [0, 5, 3, 5, 6, 10, 2, 1, 9, 1, 4]
P(A)
A = [random.randint(1, 10) for i in range(10)]
P(A)
