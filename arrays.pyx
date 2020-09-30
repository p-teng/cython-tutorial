# this gives the safe, automatic memory management from python
# no need to install a dependency, the array module is built into both Python and Cython

from cpython cimport array
import array
cdef array.array a = array.array('i', [1, 2, 3])
cdef int[:] ca = a

print(ca[0])

# CLONE ARRAY
cdef array.array newarray

# create an array with 3 elements with same type as template
from libc.string cimport memset
newarray = array.clone(int_array_template, 3, zero=False)

# EXTEND ARRAY
cdef array.array b = array.array('i', [4, 5, 6])
# extend a with b, resize as needed
array.extend(a, b)

# RESIZE ARRAY
# resize a, leaving just original three elements
array.resize(a, len(a) - len(b))

# ACCESS AS POINTER
memset(a.data.as_voidptr, 0, len(a) * sizeof(int))

