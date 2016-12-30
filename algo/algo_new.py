#!/usr/bin/python
import random
# The function returns the strictly rising sub-array with index difference == 3 that has maximum sum
def P(arr):
    n = len(arr) + 1
    A = arr
    A.insert(0, 0) # add leading zero to match algorithm methodology [ index starts at 1 ]
    debug = 1
    # B - best sum for range [ 1 .. i ]
    # fill with A[i] to skip elses in the future
    B = [A[i] for i in range(0, n)]
    # C - holds the index it got the best answer from
    C = [0 for i in range(0, n)]

    B[1] = A[1]
    C[1] = 1

    if A[2] > A[1]:
        C[2] = 1
        B[2] = B[1] + A[2]

    if A[3] > A[2]:
        C[3] = 2
        B[3] = B[2] + A[3]

    if A[3] > A[1] and B[1] + A[3] > B[3]:
        C[3] = 1
        B[3] = B[1] + A[3]

    if A[4] > A[3]:
        C[4] = 3
        B[4] = B[3] + A[4]

    if A[4] > A[2] and B[2] + A[4] > B[4]:
        C[4] = 2
        B[4] = B[2] + A[4]

    if A[4] > A[1] and B[1] + A[5] > B[4]:
        C[4] = 1
        B[4] = B[1] + A[5]

    for i in range(5, n, 1):
        if A[i] > A[i - 1]:
            B[i] = B[i - 1] + A[i]
            C[i] = i - 1

        if A[i] > A[i - 2] and B[i - 2] + A[i] > B[i]:
            B[i] = B[i - 2] + A[i]
            C[i] = i - 2

        if A[i] > A[i - 3] and B[i - 3] + A[i] > B[i]:
            B[i] = B[i - 3] + A[i]
            C[i] = i - 3

    if debug:
        print 'A', A
        print 'B', B
        print 'C', C
        print 'MAX:', max(B)

    # find max index
    maximum = A[1]
    maxindex = 1
    for i in range(1, n):
        if B[i] > maximum:
            maximum = B[i]
            maxindex = i

    # build result array
    result = []
    result.append(A[maxindex])
    next_index = C[maxindex]

    # follow the indexes
    while next_index != 0:
        result.append(A[next_index])
        next_index = C[next_index]
        if next_index == 1:
            result.append(A[next_index])
            break

    result.reverse()

    if debug:
        print 'RESULT:', result

    return result

# testing
test = [1, 3, 2, 5, 4, 1, 7]
P(test)
A = [6, 7, 5, 1, 1, 9, 3, 4, 7, 4]
P(A)
A = [random.randint(1, 10) for i in range(10)]
P(A)
