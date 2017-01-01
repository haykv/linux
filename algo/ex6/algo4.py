#!/usr/bin/python
import random


def P(arr):
    m = len(arr)
    n = len(arr[0])
    A = arr

    debug = 1
    # B - the best sum for path till [1,1] to [i,j]
    B = [[0 for i in range(n)] for i in range(m)]

    B[0][0] = A[0][0]

    for i in range(0, n):
        B[0][i] = A[0][i]

    for i in range(0, m):
        for j in range(0, n):
            if j - 1 < 0:
                left = 0
            else:
                left = B[i - 1][j - 1]
            if j + 1 >= n:
                right = 0
            else:
                right = B[i - 1][j + 1]

            B[i][j] = max(left, right) + A[i][j]

    if debug:
        print 'A'
        print2D(A)
        print 'B'
        print2D(B)

    return max(B[m - 1])


def print2D(A):
    for v in A:
        for x in v:
            print '%3s' % x, '%3s' % '|',
        print


def randomA(n, m, r):
    if m == None:
        m = 1
    if r == None:
        r = 10

    if m == 1:
        A = [random.randint(1, r) for i in range(n)]
    else:
        A = [[random.randint(1, r) for i in range(n)] for i in range(m)]
    return A


n = 4
A = randomA(4, 4, 10)
print P(A)

A = [[8, 5, 4, 5],
     [3, 3, 7, 8],
     [2, 10, 10, 8],
     [8, 8, 7, 10]
     ]
print P(A)
A = [[1, 2, 3, 7, 6],
     [2, 7, 4, 3, 8],
     [3, 5, 4, 6, 9]
     ]
print P(A)
