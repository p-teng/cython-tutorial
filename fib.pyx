from __future__ import print_function

# Simple function for printing fibonacci series up to n
def fib(n):
    a, b = 0, 1
    while b < n:
        print(b, end=' ')
        a, b = b, a + b

    print()