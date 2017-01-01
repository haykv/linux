#!/usr/bin/python
import random


def P(arr):
    n = len(arr)
    A = arr

    debug = 1
    # B - the best sum for path till [1,1] to [i,j]
    B = [[0 for i in range(n)] for i in range(n)]

    B[0][0] = A[0][0]

    for i in range(1, n):
        B[0][i] = B[0][i - 1] + A[0][i]

    for i in range(1, n):
        B[i][0] = B[i - 1][0] + A[i][0]

    for i in range(1, n):
        for j in range(1, n):
            B[i][j] = max(B[i - 1][j], B[i][j - 1]) + A[i][j]
    if debug:
        print 'A'
        print2D(A)
        print 'B'
        print2D(B)

    return B[n-1][n-1]


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
