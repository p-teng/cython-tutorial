def primes(int nb_primes): # defined in same way as python functions
    cdef int n, i, len_p # cdef defines local C variables
    cdef int p[1000] # can also dynamically allocate memory will malloc call
    
    """ 
    Note: you cannot create very large arrays in this manner, as
    they are allocated on the C function call stack, which is a 
    very scarce and precious resource. To request larger arrays/arrays
    with lengths only known at runtime, we can make efficient use of C memory allocation
    or python/NumPy arrays.
    """

    if nb_primes > 1000:
        nb_primes = 1000

    len_p = 0  # current num of elements in p
    n = 2
    while len_p < nb_primes:
        # Is n prime?
        for i in p[:len_p]:
            if n % i == 0:
                break

        # If no break occurred in the loop, num is prime
        else:
            p[len_p] = n
            len_p += 1
        n += 1

    # Python can't read C arrays, so we copy the C array into a Python list
    result_as_list  = [prime for prime in p[:len_p]] 
    # Cython automatically knows this is a Python object becasue it has no type
    return result_as_list

    # if array has dynamically allocated memory, will need to free after function call