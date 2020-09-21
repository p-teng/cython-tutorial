# distutils: language=c++
# This example uses C++ imported into Cython
from libcpp.vector cimport vector #import from cpp library

def primes(unsigned int nb_primes):
    cdef int n, i
    cdef vector[int] p # C++ vector defined
    p.reserve(nb_primes)  # allocate memory for 'nb_primes' elements.
    
    n = 2
    while p.size() < nb_primes:  # size() for vectors is similar to len()
        for i in p:
            if n % i == 0:
                break
        else:
            p.push_back(n)  # push_back is similar to append()
        n += 1

    # Vectors are automatically converted to Python
    # lists when converted to Python objects.
    return p