# GENERATED FILE, do not edit by hand
# Source: src/PyTorch.jinja2.pyx

from __future__ import print_function

import cython
cimport cython

cimport cpython.array
import array

from math import log10, floor

cimport Storage
import Storage
from lua cimport *
from nnWrapper cimport *
cimport PyTorch



#define real unsigned char
#define accreal long
#define Real Byte
#define TH_REAL_IS_BYTE

# from http://stackoverflow.com/questions/3410976/how-to-round-a-number-to-significant-figures-in-python
def round_sig(x, sig=2):
    return round(x, sig-int(floor(log10(abs(x))))-1)

cdef extern from "THRandom.h":
    cdef struct THGenerator
    void THRandom_manualSeed(THGenerator *_generator, unsigned long the_seed_)

def manualSeed(long seed):
    THRandom_manualSeed(globalState.generator, seed)

cdef floatToString(float floatValue):
    return '%.6g'% floatValue




DoubleStorage = Storage.DoubleStorage

cdef extern from "THTensor.h":
    cdef struct THDoubleTensor
    THDoubleTensor *THDoubleTensor_new()
    THDoubleTensor *THDoubleTensor_newWithSize1d(long size0)
    THDoubleTensor *THDoubleTensor_newWithSize2d(long size0, long size1)
    void THDoubleTensor_free(THDoubleTensor *self)
    int THDoubleTensor_nDimension(THDoubleTensor *tensor)
    THDoubleTensor *THDoubleTensor_newSelect(THDoubleTensor *self, int dimension, int sliceIndex)
    void THDoubleTensor_resizeAs(THDoubleTensor *self, THFloatTensor *model)
    void THDoubleTensor_resize1d(THDoubleTensor *self, long size0)
    void THDoubleTensor_resize2d(THDoubleTensor *self, long size0, long size1)
    void THDoubleTensor_resize3d(THDoubleTensor *self, long size0, long size1, long size2)
    void THDoubleTensor_resize4d(THDoubleTensor *self, long size0, long size1, long size2, long size3)
    long THDoubleTensor_size(const THDoubleTensor *self, int dim)
    long THDoubleTensor_nElement(THDoubleTensor *self)
    void THDoubleTensor_retain(THDoubleTensor *self)
    void THDoubleTensor_set1d(const THDoubleTensor *tensor, long x0, float value)
    void THDoubleTensor_set2d(const THDoubleTensor *tensor, long x0, long x1, float value)
    double THDoubleTensor_get1d(const THDoubleTensor *tensor, long x0)
    double THDoubleTensor_get2d(const THDoubleTensor *tensor, long x0, long x1)
    long THDoubleTensor_stride(const THDoubleTensor *self, int dim)
    void THDoubleTensor_fill(THDoubleTensor *self, double value)
    void THDoubleTensor_add(THDoubleTensor *r_, THDoubleTensor *t, double value)
    THDoubleTensor *THDoubleTensor_newNarrow(THDoubleTensor *self, int dimension, long firstIndex, long size)
    THDoubleTensor* THDoubleTensor_newWithStorage1d(Storage.THDoubleStorage *storage, long storageOffset, long size0, long stride0)
    THDoubleTensor* THDoubleTensor_newWithStorage2d(Storage.THDoubleStorage *storage, long storageOffset, long size0, long stride0, long size1, long stride1)
    Storage.THDoubleStorage *THDoubleTensor_storage(THDoubleTensor *self)
    void THDoubleTensor_add(THDoubleTensor *tensorSelf, THDoubleTensor *tensorOne, double value)

    void THDoubleTensor_geometric(THDoubleTensor *self, THGenerator *_generator, double p)
    void THDoubleTensor_bernoulli(THDoubleTensor *self, THGenerator *_generator, double p)

    
    void THDoubleTensor_addmm(THDoubleTensor *tensorSelf, double beta, THDoubleTensor *tensorOne, double alpha, THDoubleTensor *mat1, THDoubleTensor *mat2)

    void THDoubleTensor_uniform(THDoubleTensor *self, THGenerator *_generator, double a, double b)
    void THDoubleTensor_normal(THDoubleTensor *self, THGenerator *_generator, double mean, double stdv)
    void THDoubleTensor_exponential(THDoubleTensor *self, THGenerator *_generator, double _lambda);
    void THDoubleTensor_cauchy(THDoubleTensor *self, THGenerator *_generator, double median, double sigma)
    void THDoubleTensor_logNormal(THDoubleTensor *self, THGenerator *_generator, double mean, double stdv)
    



ByteStorage = Storage.ByteStorage

cdef extern from "THTensor.h":
    cdef struct THByteTensor
    THByteTensor *THByteTensor_new()
    THByteTensor *THByteTensor_newWithSize1d(long size0)
    THByteTensor *THByteTensor_newWithSize2d(long size0, long size1)
    void THByteTensor_free(THByteTensor *self)
    int THByteTensor_nDimension(THByteTensor *tensor)
    THByteTensor *THByteTensor_newSelect(THByteTensor *self, int dimension, int sliceIndex)
    void THByteTensor_resizeAs(THByteTensor *self, THFloatTensor *model)
    void THByteTensor_resize1d(THByteTensor *self, long size0)
    void THByteTensor_resize2d(THByteTensor *self, long size0, long size1)
    void THByteTensor_resize3d(THByteTensor *self, long size0, long size1, long size2)
    void THByteTensor_resize4d(THByteTensor *self, long size0, long size1, long size2, long size3)
    long THByteTensor_size(const THByteTensor *self, int dim)
    long THByteTensor_nElement(THByteTensor *self)
    void THByteTensor_retain(THByteTensor *self)
    void THByteTensor_set1d(const THByteTensor *tensor, long x0, float value)
    void THByteTensor_set2d(const THByteTensor *tensor, long x0, long x1, float value)
    unsigned char THByteTensor_get1d(const THByteTensor *tensor, long x0)
    unsigned char THByteTensor_get2d(const THByteTensor *tensor, long x0, long x1)
    long THByteTensor_stride(const THByteTensor *self, int dim)
    void THByteTensor_fill(THByteTensor *self, unsigned char value)
    void THByteTensor_add(THByteTensor *r_, THByteTensor *t, unsigned char value)
    THByteTensor *THByteTensor_newNarrow(THByteTensor *self, int dimension, long firstIndex, long size)
    THByteTensor* THByteTensor_newWithStorage1d(Storage.THByteStorage *storage, long storageOffset, long size0, long stride0)
    THByteTensor* THByteTensor_newWithStorage2d(Storage.THByteStorage *storage, long storageOffset, long size0, long stride0, long size1, long stride1)
    Storage.THByteStorage *THByteTensor_storage(THByteTensor *self)
    void THByteTensor_add(THByteTensor *tensorSelf, THByteTensor *tensorOne, unsigned char value)

    void THByteTensor_geometric(THByteTensor *self, THGenerator *_generator, double p)
    void THByteTensor_bernoulli(THByteTensor *self, THGenerator *_generator, double p)

    



FloatStorage = Storage.FloatStorage

cdef extern from "THTensor.h":
    cdef struct THFloatTensor
    THFloatTensor *THFloatTensor_new()
    THFloatTensor *THFloatTensor_newWithSize1d(long size0)
    THFloatTensor *THFloatTensor_newWithSize2d(long size0, long size1)
    void THFloatTensor_free(THFloatTensor *self)
    int THFloatTensor_nDimension(THFloatTensor *tensor)
    THFloatTensor *THFloatTensor_newSelect(THFloatTensor *self, int dimension, int sliceIndex)
    void THFloatTensor_resizeAs(THFloatTensor *self, THFloatTensor *model)
    void THFloatTensor_resize1d(THFloatTensor *self, long size0)
    void THFloatTensor_resize2d(THFloatTensor *self, long size0, long size1)
    void THFloatTensor_resize3d(THFloatTensor *self, long size0, long size1, long size2)
    void THFloatTensor_resize4d(THFloatTensor *self, long size0, long size1, long size2, long size3)
    long THFloatTensor_size(const THFloatTensor *self, int dim)
    long THFloatTensor_nElement(THFloatTensor *self)
    void THFloatTensor_retain(THFloatTensor *self)
    void THFloatTensor_set1d(const THFloatTensor *tensor, long x0, float value)
    void THFloatTensor_set2d(const THFloatTensor *tensor, long x0, long x1, float value)
    float THFloatTensor_get1d(const THFloatTensor *tensor, long x0)
    float THFloatTensor_get2d(const THFloatTensor *tensor, long x0, long x1)
    long THFloatTensor_stride(const THFloatTensor *self, int dim)
    void THFloatTensor_fill(THFloatTensor *self, float value)
    void THFloatTensor_add(THFloatTensor *r_, THFloatTensor *t, float value)
    THFloatTensor *THFloatTensor_newNarrow(THFloatTensor *self, int dimension, long firstIndex, long size)
    THFloatTensor* THFloatTensor_newWithStorage1d(Storage.THFloatStorage *storage, long storageOffset, long size0, long stride0)
    THFloatTensor* THFloatTensor_newWithStorage2d(Storage.THFloatStorage *storage, long storageOffset, long size0, long stride0, long size1, long stride1)
    Storage.THFloatStorage *THFloatTensor_storage(THFloatTensor *self)
    void THFloatTensor_add(THFloatTensor *tensorSelf, THFloatTensor *tensorOne, float value)

    void THFloatTensor_geometric(THFloatTensor *self, THGenerator *_generator, double p)
    void THFloatTensor_bernoulli(THFloatTensor *self, THGenerator *_generator, double p)

    
    void THFloatTensor_addmm(THFloatTensor *tensorSelf, double beta, THFloatTensor *tensorOne, double alpha, THFloatTensor *mat1, THFloatTensor *mat2)

    void THFloatTensor_uniform(THFloatTensor *self, THGenerator *_generator, double a, double b)
    void THFloatTensor_normal(THFloatTensor *self, THGenerator *_generator, double mean, double stdv)
    void THFloatTensor_exponential(THFloatTensor *self, THGenerator *_generator, double _lambda);
    void THFloatTensor_cauchy(THFloatTensor *self, THGenerator *_generator, double median, double sigma)
    void THFloatTensor_logNormal(THFloatTensor *self, THGenerator *_generator, double mean, double stdv)
    



LongStorage = Storage.LongStorage

cdef extern from "THTensor.h":
    cdef struct THLongTensor
    THLongTensor *THLongTensor_new()
    THLongTensor *THLongTensor_newWithSize1d(long size0)
    THLongTensor *THLongTensor_newWithSize2d(long size0, long size1)
    void THLongTensor_free(THLongTensor *self)
    int THLongTensor_nDimension(THLongTensor *tensor)
    THLongTensor *THLongTensor_newSelect(THLongTensor *self, int dimension, int sliceIndex)
    void THLongTensor_resizeAs(THLongTensor *self, THFloatTensor *model)
    void THLongTensor_resize1d(THLongTensor *self, long size0)
    void THLongTensor_resize2d(THLongTensor *self, long size0, long size1)
    void THLongTensor_resize3d(THLongTensor *self, long size0, long size1, long size2)
    void THLongTensor_resize4d(THLongTensor *self, long size0, long size1, long size2, long size3)
    long THLongTensor_size(const THLongTensor *self, int dim)
    long THLongTensor_nElement(THLongTensor *self)
    void THLongTensor_retain(THLongTensor *self)
    void THLongTensor_set1d(const THLongTensor *tensor, long x0, float value)
    void THLongTensor_set2d(const THLongTensor *tensor, long x0, long x1, float value)
    long THLongTensor_get1d(const THLongTensor *tensor, long x0)
    long THLongTensor_get2d(const THLongTensor *tensor, long x0, long x1)
    long THLongTensor_stride(const THLongTensor *self, int dim)
    void THLongTensor_fill(THLongTensor *self, long value)
    void THLongTensor_add(THLongTensor *r_, THLongTensor *t, long value)
    THLongTensor *THLongTensor_newNarrow(THLongTensor *self, int dimension, long firstIndex, long size)
    THLongTensor* THLongTensor_newWithStorage1d(Storage.THLongStorage *storage, long storageOffset, long size0, long stride0)
    THLongTensor* THLongTensor_newWithStorage2d(Storage.THLongStorage *storage, long storageOffset, long size0, long stride0, long size1, long stride1)
    Storage.THLongStorage *THLongTensor_storage(THLongTensor *self)
    void THLongTensor_add(THLongTensor *tensorSelf, THLongTensor *tensorOne, long value)

    void THLongTensor_geometric(THLongTensor *self, THGenerator *_generator, double p)
    void THLongTensor_bernoulli(THLongTensor *self, THGenerator *_generator, double p)

    




cdef class _DoubleTensor(object):
    # properties are in the PyTorch.pxd file

#    def __cinit__(Tensor self, THFloatTensor *tensorC = NULL):
#        self.thFloatTensor = tensorC

    def __cinit__(self, *args, _allocate=True):
#        print('DoubleTensor.__cinit__')
#        cdef THDoubleStorage *storageC
#        cdef long addr
#        if len(kwargs) > 0:
#            raise Exception('cannot provide arguments to initializer')
        if _allocate:
#            if len(args) == 1 and isinstance(args[0], _LongTensor):  # it's a size tensor
#                self.thFloatTensor = THFloatTensor_new()
            for arg in args:
                if not isinstance(arg, int):
                    raise Exception('cannot provide arguments to initializer')
            if len(args) == 0:
#                print('no args, calling THDoubleTensor_new()')
                self.thDoubleTensor = THDoubleTensor_new()
            elif len(args) == 1:
#                print('new tensor 1d length', args[0])
                self.thDoubleTensor = THDoubleTensor_newWithSize1d(args[0])
#                storageC = THFloatTensor_storage(self.thFloatTensor)
#                if storageC == NULL:
#                    print('storageC is NULL')
#                else:
#                    print('storageC not null')
#                    addr = <long>(storageC)
#                    print('storageaddr', hex(addr))
#                    print('storageC refcount', THFloatStorage_getRefCount(storageC))
            elif len(args) == 2:
                self.thDoubleTensor = THDoubleTensor_newWithSize2d(args[0], args[1])
            else:
                raise Exception('Not implemented, len(args)=' + str(len(args)))

#    def __cinit__(self, THFloatTensor *tensorC, Storage storage):
#        self.thFloatTensor = tensorC
#        self.storage = storage

#    def __cinit__(self, Storage storage, offset, size0, stride0, size1, stride1):
#        self.thFloatTensor = THFloatTensor_newWithStorage2d(storage.thFloatStorage, offset, size0, stride0, size1, stride1)
#        self.storage = storage

    def __dealloc__(self):
        cdef int refCount
#        cdef int dims
#        cdef int size
#        cdef int i
#        cdef THFloatStorage *storage
        refCount = THDoubleTensor_getRefCount(self.thDoubleTensor)
#        print('DoubleTensor.dealloc old refcount', refCount)
#        storage = THFloatTensor_storage(self.thFloatTensor)
#        if storage == NULL:
#            print('   dealloc, storage NULL')
#        else:
#            print('   dealloc, storage ', hex(<long>(storage)))
#        dims = THFloatTensor_nDimension(self.thFloatTensor)
#        print('   dims of dealloc', dims)
#        for i in range(dims):
#            print('   size[', i, ']', THFloatTensor_size(self.thFloatTensor, i))
        if refCount < 1:
            raise Exception('Unallocated an already deallocated tensor... :-O')  # Hmmm, seems this exceptoin wont go anywhere useful... :-P
        THDoubleTensor_free(self.thDoubleTensor)

    def nElement(_DoubleTensor self):
        return THDoubleTensor_nElement(self.thDoubleTensor)

    @property
    def refCount(_DoubleTensor self):
        return THDoubleTensor_getRefCount(self.thDoubleTensor)

    cpdef int dims(self):
        return THDoubleTensor_nDimension(self.thDoubleTensor)

    cpdef set1d(self, int x0, double value):
        THDoubleTensor_set1d(self.thDoubleTensor, x0, value)

    cpdef set2d(self, int x0, int x1, double value):
        THDoubleTensor_set2d(self.thDoubleTensor, x0, x1, value)

    cpdef double get1d(self, int x0):
        return THDoubleTensor_get1d(self.thDoubleTensor, x0)

    cpdef double get2d(self, int x0, int x1):
        return THDoubleTensor_get2d(self.thDoubleTensor, x0, x1)

    def __repr__(_DoubleTensor self):
        # assume 2d matrix for now
        cdef int size0
        cdef int size1
        dims = self.dims()
        if dims == 0:
            return '[torch.DoubleTensor with no dimension]\n'
        elif dims == 2:
            size0 = THDoubleTensor_size(self.thDoubleTensor, 0)
            size1 = THDoubleTensor_size(self.thDoubleTensor, 1)
            res = ''
            for r in range(size0):
                thisline = ''
                for c in range(size1):
                    if c > 0:
                        thisline += ' '
                    
                    thisline += str(self.get2d(r,c),)
                    
                res += thisline + '\n'
            res += '[torch.DoubleTensor of size ' + ('%.0f' % size0) + 'x' + str(size1) + ']\n'
            return res
        elif dims == 1:
            size0 = THDoubleTensor_size(self.thDoubleTensor, 0)
            res = ''
            thisline = ''
            for c in range(size0):
                if c > 0:
                    thisline += ' '
                
                thisline += str(self.get1d(c))
                
            res += thisline + '\n'
            res += '[torch.DoubleTensor of size ' + str(size0) + ']\n'
            return res
        else:
            raise Exception("Not implemented: dims > 2")

    def __getitem__(_DoubleTensor self, int index):
        if self.dims() == 1:
            return self.get1d(index)
        cdef THDoubleTensor *res = THDoubleTensor_newSelect(self.thDoubleTensor, 0, index)
        return _DoubleTensor_fromNative(res, False)

    def __setitem__(_DoubleTensor self, int index, double value):
        if self.dims() == 1:
            self.set1d(index, value)
        else:
            raise Exception("not implemented")

    def fill(_DoubleTensor self, double value):
        THDoubleTensor_fill(self.thDoubleTensor, value)
        return self

    def size(_DoubleTensor self):
        cdef int dims = self.dims()
        cdef _LongTensor size
        if dims > 0:
            size = _LongTensor(dims)
            for d in range(dims):
                size.set1d(d, THDoubleTensor_size(self.thDoubleTensor, d))
            return size
        else:
            return None  # not sure how to handle this yet

    @staticmethod
    def new():
#        print('allocate tensor')
        return _DoubleTensor()
#        return _FloatTensor_fromNative(newTensorC, False)

    def __add__(_DoubleTensor self, double value):
        # assume 2d matrix for now?
        cdef _DoubleTensor res = _DoubleTensor.new()
#        THFloatTensor_resizeAs(cresult, self.thFloatTensor)
        THDoubleTensor_add(res.thDoubleTensor, self.thDoubleTensor, value)
        return res

    def narrow(_DoubleTensor self, int dimension, long firstIndex, long size):
        cdef THDoubleTensor *narrowedC = THDoubleTensor_newNarrow(self.thDoubleTensor, dimension, firstIndex, size)
        return _DoubleTensor_fromNative(narrowedC, retain=False)

    def resize1d(_DoubleTensor self, int size0):
        THDoubleTensor_resize1d(self.thDoubleTensor, size0)
        return self

    def resize2d(_DoubleTensor self, int size0, int size1):
        THDoubleTensor_resize2d(self.thDoubleTensor, size0, size1)
        return self

    def resize3d(_DoubleTensor self, int size0, int size1, int size2):
        THDoubleTensor_resize3d(self.thDoubleTensor, size0, size1, size2)
        return self

    def resize4d(_DoubleTensor self, int size0, int size1, int size2, int size3):
        THDoubleTensor_resize4d(self.thDoubleTensor, size0, size1, size2, size3)
        return self

    def resize(_DoubleTensor self, _LongTensor size):
#        print('_FloatTensor.resize size:', size)
        if size.dims() == 0:
            return self
        cdef int dims = size.size()[0]
#        print('_FloatTensor.resize dims:', dims)
        if dims == 1:
            THDoubleTensor_resize1d(self.thDoubleTensor, size[0])
        elif dims == 2:
            THDoubleTensor_resize2d(self.thDoubleTensor, size[0], size[1])
        elif dims == 3:
            THDoubleTensor_resize3d(self.thDoubleTensor, size[0], size[1], size[2])
        elif dims == 4:
            THDoubleTensor_resize4d(self.thDoubleTensor, size[0], size[1], size[2], size[3])
        else:
            raise Exception('Not implemented for dims=' + str(dims))
        return self

    @staticmethod
    def newWithStorage1d(Storage.DoubleStorage storage, offset, size0, stride0):
#        print('allocate tensor')
        cdef THDoubleTensor *newTensorC = THDoubleTensor_newWithStorage1d(storage.thDoubleStorage, offset, size0, stride0)
        return _DoubleTensor_fromNative(newTensorC, False)

    @staticmethod
    def newWithStorage2d(Storage.DoubleStorage storage, offset, size0, stride0, size1, stride1):
#        print('allocate tensor')
        cdef THDoubleTensor *newTensorC = THDoubleTensor_newWithStorage2d(storage.thDoubleStorage, offset, size0, stride0, size1, stride1)
        return _DoubleTensor_fromNative(newTensorC, False)

    def storage(_DoubleTensor self):
        cdef Storage.THDoubleStorage *storageC = THDoubleTensor_storage(self.thDoubleTensor)
        if storageC == NULL:
            return None
        return Storage.DoubleStorage_fromNative(storageC)

    def __iadd__(_DoubleTensor self, double value):
        THDoubleTensor_add(self.thDoubleTensor, self.thDoubleTensor, value)
        return self

    # ========== random ===============================

    def bernoulli(_DoubleTensor self, float p=0.5):
        THDoubleTensor_bernoulli(self.thDoubleTensor, globalState.generator, p)
        return self

    def geometric(_DoubleTensor self, float p=0.5):
        THDoubleTensor_geometric(self.thDoubleTensor, globalState.generator, p)
        return self


    def __mul__(_DoubleTensor self, _DoubleTensor M2):
        cdef _DoubleTensor T = _DoubleTensor.new()
        cdef _DoubleTensor res = _DoubleTensor.new()
        cdef int resRows = THDoubleTensor_size(self.thDoubleTensor, 0)
        cdef int resCols = THDoubleTensor_size(M2.thDoubleTensor, 1)
        res.resize2d(resRows, resCols)
        T.resize2d(resRows, resCols)
        THDoubleTensor_addmm(res.thDoubleTensor, 0, T.thDoubleTensor, 1, self.thDoubleTensor, M2.thDoubleTensor)
        return res

    def normal(_DoubleTensor self, double mean=0, double stdv=1):
        THDoubleTensor_normal(self.thDoubleTensor, globalState.generator, mean, stdv)
        return self

    def exponential(_DoubleTensor self, double _lambda=1):
        THDoubleTensor_exponential(self.thDoubleTensor, globalState.generator, _lambda)
        return self

    def cauchy(_DoubleTensor self, double median=0, double sigma=1):
        THDoubleTensor_cauchy(self.thDoubleTensor, globalState.generator, median, sigma)
        return self

    def logNormal(_DoubleTensor self, double mean=1, double stdv=2):
        THDoubleTensor_logNormal(self.thDoubleTensor, globalState.generator, mean, stdv)
        return self

    def uniform(_DoubleTensor self, double a=0, double b=1):
        THDoubleTensor_uniform(self.thDoubleTensor, globalState.generator, a, b)
        return self


#    @staticmethod
cdef _DoubleTensor_fromNative(THDoubleTensor *tensorC, retain=True):
    if retain:
        THDoubleTensor_retain(tensorC)
    tensor = _DoubleTensor(_allocate=False)
    tensor.thDoubleTensor = tensorC
    return tensor



cdef class _ByteTensor(object):
    # properties are in the PyTorch.pxd file

#    def __cinit__(Tensor self, THFloatTensor *tensorC = NULL):
#        self.thFloatTensor = tensorC

    def __cinit__(self, *args, _allocate=True):
#        print('ByteTensor.__cinit__')
#        cdef THByteStorage *storageC
#        cdef long addr
#        if len(kwargs) > 0:
#            raise Exception('cannot provide arguments to initializer')
        if _allocate:
#            if len(args) == 1 and isinstance(args[0], _LongTensor):  # it's a size tensor
#                self.thFloatTensor = THFloatTensor_new()
            for arg in args:
                if not isinstance(arg, int):
                    raise Exception('cannot provide arguments to initializer')
            if len(args) == 0:
#                print('no args, calling THByteTensor_new()')
                self.thByteTensor = THByteTensor_new()
            elif len(args) == 1:
#                print('new tensor 1d length', args[0])
                self.thByteTensor = THByteTensor_newWithSize1d(args[0])
#                storageC = THFloatTensor_storage(self.thFloatTensor)
#                if storageC == NULL:
#                    print('storageC is NULL')
#                else:
#                    print('storageC not null')
#                    addr = <long>(storageC)
#                    print('storageaddr', hex(addr))
#                    print('storageC refcount', THFloatStorage_getRefCount(storageC))
            elif len(args) == 2:
                self.thByteTensor = THByteTensor_newWithSize2d(args[0], args[1])
            else:
                raise Exception('Not implemented, len(args)=' + str(len(args)))

#    def __cinit__(self, THFloatTensor *tensorC, Storage storage):
#        self.thFloatTensor = tensorC
#        self.storage = storage

#    def __cinit__(self, Storage storage, offset, size0, stride0, size1, stride1):
#        self.thFloatTensor = THFloatTensor_newWithStorage2d(storage.thFloatStorage, offset, size0, stride0, size1, stride1)
#        self.storage = storage

    def __dealloc__(self):
        cdef int refCount
#        cdef int dims
#        cdef int size
#        cdef int i
#        cdef THFloatStorage *storage
        refCount = THByteTensor_getRefCount(self.thByteTensor)
#        print('ByteTensor.dealloc old refcount', refCount)
#        storage = THFloatTensor_storage(self.thFloatTensor)
#        if storage == NULL:
#            print('   dealloc, storage NULL')
#        else:
#            print('   dealloc, storage ', hex(<long>(storage)))
#        dims = THFloatTensor_nDimension(self.thFloatTensor)
#        print('   dims of dealloc', dims)
#        for i in range(dims):
#            print('   size[', i, ']', THFloatTensor_size(self.thFloatTensor, i))
        if refCount < 1:
            raise Exception('Unallocated an already deallocated tensor... :-O')  # Hmmm, seems this exceptoin wont go anywhere useful... :-P
        THByteTensor_free(self.thByteTensor)

    def nElement(_ByteTensor self):
        return THByteTensor_nElement(self.thByteTensor)

    @property
    def refCount(_ByteTensor self):
        return THByteTensor_getRefCount(self.thByteTensor)

    cpdef int dims(self):
        return THByteTensor_nDimension(self.thByteTensor)

    cpdef set1d(self, int x0, unsigned char value):
        THByteTensor_set1d(self.thByteTensor, x0, value)

    cpdef set2d(self, int x0, int x1, unsigned char value):
        THByteTensor_set2d(self.thByteTensor, x0, x1, value)

    cpdef unsigned char get1d(self, int x0):
        return THByteTensor_get1d(self.thByteTensor, x0)

    cpdef unsigned char get2d(self, int x0, int x1):
        return THByteTensor_get2d(self.thByteTensor, x0, x1)

    def __repr__(_ByteTensor self):
        # assume 2d matrix for now
        cdef int size0
        cdef int size1
        dims = self.dims()
        if dims == 0:
            return '[torch.ByteTensor with no dimension]\n'
        elif dims == 2:
            size0 = THByteTensor_size(self.thByteTensor, 0)
            size1 = THByteTensor_size(self.thByteTensor, 1)
            res = ''
            for r in range(size0):
                thisline = ''
                for c in range(size1):
                    if c > 0:
                        thisline += ' '
                    
                    thisline += str(self.get2d(r,c),)
                    
                res += thisline + '\n'
            res += '[torch.ByteTensor of size ' + ('%.0f' % size0) + 'x' + str(size1) + ']\n'
            return res
        elif dims == 1:
            size0 = THByteTensor_size(self.thByteTensor, 0)
            res = ''
            thisline = ''
            for c in range(size0):
                if c > 0:
                    thisline += ' '
                
                thisline += str(self.get1d(c))
                
            res += thisline + '\n'
            res += '[torch.ByteTensor of size ' + str(size0) + ']\n'
            return res
        else:
            raise Exception("Not implemented: dims > 2")

    def __getitem__(_ByteTensor self, int index):
        if self.dims() == 1:
            return self.get1d(index)
        cdef THByteTensor *res = THByteTensor_newSelect(self.thByteTensor, 0, index)
        return _ByteTensor_fromNative(res, False)

    def __setitem__(_ByteTensor self, int index, unsigned char value):
        if self.dims() == 1:
            self.set1d(index, value)
        else:
            raise Exception("not implemented")

    def fill(_ByteTensor self, unsigned char value):
        THByteTensor_fill(self.thByteTensor, value)
        return self

    def size(_ByteTensor self):
        cdef int dims = self.dims()
        cdef _LongTensor size
        if dims > 0:
            size = _LongTensor(dims)
            for d in range(dims):
                size.set1d(d, THByteTensor_size(self.thByteTensor, d))
            return size
        else:
            return None  # not sure how to handle this yet

    @staticmethod
    def new():
#        print('allocate tensor')
        return _ByteTensor()
#        return _FloatTensor_fromNative(newTensorC, False)

    def __add__(_ByteTensor self, unsigned char value):
        # assume 2d matrix for now?
        cdef _ByteTensor res = _ByteTensor.new()
#        THFloatTensor_resizeAs(cresult, self.thFloatTensor)
        THByteTensor_add(res.thByteTensor, self.thByteTensor, value)
        return res

    def narrow(_ByteTensor self, int dimension, long firstIndex, long size):
        cdef THByteTensor *narrowedC = THByteTensor_newNarrow(self.thByteTensor, dimension, firstIndex, size)
        return _ByteTensor_fromNative(narrowedC, retain=False)

    def resize1d(_ByteTensor self, int size0):
        THByteTensor_resize1d(self.thByteTensor, size0)
        return self

    def resize2d(_ByteTensor self, int size0, int size1):
        THByteTensor_resize2d(self.thByteTensor, size0, size1)
        return self

    def resize3d(_ByteTensor self, int size0, int size1, int size2):
        THByteTensor_resize3d(self.thByteTensor, size0, size1, size2)
        return self

    def resize4d(_ByteTensor self, int size0, int size1, int size2, int size3):
        THByteTensor_resize4d(self.thByteTensor, size0, size1, size2, size3)
        return self

    def resize(_ByteTensor self, _LongTensor size):
#        print('_FloatTensor.resize size:', size)
        if size.dims() == 0:
            return self
        cdef int dims = size.size()[0]
#        print('_FloatTensor.resize dims:', dims)
        if dims == 1:
            THByteTensor_resize1d(self.thByteTensor, size[0])
        elif dims == 2:
            THByteTensor_resize2d(self.thByteTensor, size[0], size[1])
        elif dims == 3:
            THByteTensor_resize3d(self.thByteTensor, size[0], size[1], size[2])
        elif dims == 4:
            THByteTensor_resize4d(self.thByteTensor, size[0], size[1], size[2], size[3])
        else:
            raise Exception('Not implemented for dims=' + str(dims))
        return self

    @staticmethod
    def newWithStorage1d(Storage.ByteStorage storage, offset, size0, stride0):
#        print('allocate tensor')
        cdef THByteTensor *newTensorC = THByteTensor_newWithStorage1d(storage.thByteStorage, offset, size0, stride0)
        return _ByteTensor_fromNative(newTensorC, False)

    @staticmethod
    def newWithStorage2d(Storage.ByteStorage storage, offset, size0, stride0, size1, stride1):
#        print('allocate tensor')
        cdef THByteTensor *newTensorC = THByteTensor_newWithStorage2d(storage.thByteStorage, offset, size0, stride0, size1, stride1)
        return _ByteTensor_fromNative(newTensorC, False)

    def storage(_ByteTensor self):
        cdef Storage.THByteStorage *storageC = THByteTensor_storage(self.thByteTensor)
        if storageC == NULL:
            return None
        return Storage.ByteStorage_fromNative(storageC)

    def __iadd__(_ByteTensor self, unsigned char value):
        THByteTensor_add(self.thByteTensor, self.thByteTensor, value)
        return self

    # ========== random ===============================

    def bernoulli(_ByteTensor self, float p=0.5):
        THByteTensor_bernoulli(self.thByteTensor, globalState.generator, p)
        return self

    def geometric(_ByteTensor self, float p=0.5):
        THByteTensor_geometric(self.thByteTensor, globalState.generator, p)
        return self



#    @staticmethod
cdef _ByteTensor_fromNative(THByteTensor *tensorC, retain=True):
    if retain:
        THByteTensor_retain(tensorC)
    tensor = _ByteTensor(_allocate=False)
    tensor.thByteTensor = tensorC
    return tensor



cdef class _FloatTensor(object):
    # properties are in the PyTorch.pxd file

#    def __cinit__(Tensor self, THFloatTensor *tensorC = NULL):
#        self.thFloatTensor = tensorC

    def __cinit__(self, *args, _allocate=True):
#        print('FloatTensor.__cinit__')
#        cdef THFloatStorage *storageC
#        cdef long addr
#        if len(kwargs) > 0:
#            raise Exception('cannot provide arguments to initializer')
        if _allocate:
#            if len(args) == 1 and isinstance(args[0], _LongTensor):  # it's a size tensor
#                self.thFloatTensor = THFloatTensor_new()
            for arg in args:
                if not isinstance(arg, int):
                    raise Exception('cannot provide arguments to initializer')
            if len(args) == 0:
#                print('no args, calling THFloatTensor_new()')
                self.thFloatTensor = THFloatTensor_new()
            elif len(args) == 1:
#                print('new tensor 1d length', args[0])
                self.thFloatTensor = THFloatTensor_newWithSize1d(args[0])
#                storageC = THFloatTensor_storage(self.thFloatTensor)
#                if storageC == NULL:
#                    print('storageC is NULL')
#                else:
#                    print('storageC not null')
#                    addr = <long>(storageC)
#                    print('storageaddr', hex(addr))
#                    print('storageC refcount', THFloatStorage_getRefCount(storageC))
            elif len(args) == 2:
                self.thFloatTensor = THFloatTensor_newWithSize2d(args[0], args[1])
            else:
                raise Exception('Not implemented, len(args)=' + str(len(args)))

#    def __cinit__(self, THFloatTensor *tensorC, Storage storage):
#        self.thFloatTensor = tensorC
#        self.storage = storage

#    def __cinit__(self, Storage storage, offset, size0, stride0, size1, stride1):
#        self.thFloatTensor = THFloatTensor_newWithStorage2d(storage.thFloatStorage, offset, size0, stride0, size1, stride1)
#        self.storage = storage

    def __dealloc__(self):
        cdef int refCount
#        cdef int dims
#        cdef int size
#        cdef int i
#        cdef THFloatStorage *storage
        refCount = THFloatTensor_getRefCount(self.thFloatTensor)
#        print('FloatTensor.dealloc old refcount', refCount)
#        storage = THFloatTensor_storage(self.thFloatTensor)
#        if storage == NULL:
#            print('   dealloc, storage NULL')
#        else:
#            print('   dealloc, storage ', hex(<long>(storage)))
#        dims = THFloatTensor_nDimension(self.thFloatTensor)
#        print('   dims of dealloc', dims)
#        for i in range(dims):
#            print('   size[', i, ']', THFloatTensor_size(self.thFloatTensor, i))
        if refCount < 1:
            raise Exception('Unallocated an already deallocated tensor... :-O')  # Hmmm, seems this exceptoin wont go anywhere useful... :-P
        THFloatTensor_free(self.thFloatTensor)

    def nElement(_FloatTensor self):
        return THFloatTensor_nElement(self.thFloatTensor)

    @property
    def refCount(_FloatTensor self):
        return THFloatTensor_getRefCount(self.thFloatTensor)

    cpdef int dims(self):
        return THFloatTensor_nDimension(self.thFloatTensor)

    cpdef set1d(self, int x0, float value):
        THFloatTensor_set1d(self.thFloatTensor, x0, value)

    cpdef set2d(self, int x0, int x1, float value):
        THFloatTensor_set2d(self.thFloatTensor, x0, x1, value)

    cpdef float get1d(self, int x0):
        return THFloatTensor_get1d(self.thFloatTensor, x0)

    cpdef float get2d(self, int x0, int x1):
        return THFloatTensor_get2d(self.thFloatTensor, x0, x1)

    def __repr__(_FloatTensor self):
        # assume 2d matrix for now
        cdef int size0
        cdef int size1
        dims = self.dims()
        if dims == 0:
            return '[torch.FloatTensor with no dimension]\n'
        elif dims == 2:
            size0 = THFloatTensor_size(self.thFloatTensor, 0)
            size1 = THFloatTensor_size(self.thFloatTensor, 1)
            res = ''
            for r in range(size0):
                thisline = ''
                for c in range(size1):
                    if c > 0:
                        thisline += ' '
                    
                    thisline += floatToString(self.get2d(r,c),)
                    
                res += thisline + '\n'
            res += '[torch.FloatTensor of size ' + ('%.0f' % size0) + 'x' + str(size1) + ']\n'
            return res
        elif dims == 1:
            size0 = THFloatTensor_size(self.thFloatTensor, 0)
            res = ''
            thisline = ''
            for c in range(size0):
                if c > 0:
                    thisline += ' '
                
                thisline += floatToString(self.get1d(c))
                
            res += thisline + '\n'
            res += '[torch.FloatTensor of size ' + str(size0) + ']\n'
            return res
        else:
            raise Exception("Not implemented: dims > 2")

    def __getitem__(_FloatTensor self, int index):
        if self.dims() == 1:
            return self.get1d(index)
        cdef THFloatTensor *res = THFloatTensor_newSelect(self.thFloatTensor, 0, index)
        return _FloatTensor_fromNative(res, False)

    def __setitem__(_FloatTensor self, int index, float value):
        if self.dims() == 1:
            self.set1d(index, value)
        else:
            raise Exception("not implemented")

    def fill(_FloatTensor self, float value):
        THFloatTensor_fill(self.thFloatTensor, value)
        return self

    def size(_FloatTensor self):
        cdef int dims = self.dims()
        cdef _LongTensor size
        if dims > 0:
            size = _LongTensor(dims)
            for d in range(dims):
                size.set1d(d, THFloatTensor_size(self.thFloatTensor, d))
            return size
        else:
            return None  # not sure how to handle this yet

    @staticmethod
    def new():
#        print('allocate tensor')
        return _FloatTensor()
#        return _FloatTensor_fromNative(newTensorC, False)

    def __add__(_FloatTensor self, float value):
        # assume 2d matrix for now?
        cdef _FloatTensor res = _FloatTensor.new()
#        THFloatTensor_resizeAs(cresult, self.thFloatTensor)
        THFloatTensor_add(res.thFloatTensor, self.thFloatTensor, value)
        return res

    def narrow(_FloatTensor self, int dimension, long firstIndex, long size):
        cdef THFloatTensor *narrowedC = THFloatTensor_newNarrow(self.thFloatTensor, dimension, firstIndex, size)
        return _FloatTensor_fromNative(narrowedC, retain=False)

    def resize1d(_FloatTensor self, int size0):
        THFloatTensor_resize1d(self.thFloatTensor, size0)
        return self

    def resize2d(_FloatTensor self, int size0, int size1):
        THFloatTensor_resize2d(self.thFloatTensor, size0, size1)
        return self

    def resize3d(_FloatTensor self, int size0, int size1, int size2):
        THFloatTensor_resize3d(self.thFloatTensor, size0, size1, size2)
        return self

    def resize4d(_FloatTensor self, int size0, int size1, int size2, int size3):
        THFloatTensor_resize4d(self.thFloatTensor, size0, size1, size2, size3)
        return self

    def resize(_FloatTensor self, _LongTensor size):
#        print('_FloatTensor.resize size:', size)
        if size.dims() == 0:
            return self
        cdef int dims = size.size()[0]
#        print('_FloatTensor.resize dims:', dims)
        if dims == 1:
            THFloatTensor_resize1d(self.thFloatTensor, size[0])
        elif dims == 2:
            THFloatTensor_resize2d(self.thFloatTensor, size[0], size[1])
        elif dims == 3:
            THFloatTensor_resize3d(self.thFloatTensor, size[0], size[1], size[2])
        elif dims == 4:
            THFloatTensor_resize4d(self.thFloatTensor, size[0], size[1], size[2], size[3])
        else:
            raise Exception('Not implemented for dims=' + str(dims))
        return self

    @staticmethod
    def newWithStorage1d(Storage.FloatStorage storage, offset, size0, stride0):
#        print('allocate tensor')
        cdef THFloatTensor *newTensorC = THFloatTensor_newWithStorage1d(storage.thFloatStorage, offset, size0, stride0)
        return _FloatTensor_fromNative(newTensorC, False)

    @staticmethod
    def newWithStorage2d(Storage.FloatStorage storage, offset, size0, stride0, size1, stride1):
#        print('allocate tensor')
        cdef THFloatTensor *newTensorC = THFloatTensor_newWithStorage2d(storage.thFloatStorage, offset, size0, stride0, size1, stride1)
        return _FloatTensor_fromNative(newTensorC, False)

    def storage(_FloatTensor self):
        cdef Storage.THFloatStorage *storageC = THFloatTensor_storage(self.thFloatTensor)
        if storageC == NULL:
            return None
        return Storage.FloatStorage_fromNative(storageC)

    def __iadd__(_FloatTensor self, float value):
        THFloatTensor_add(self.thFloatTensor, self.thFloatTensor, value)
        return self

    # ========== random ===============================

    def bernoulli(_FloatTensor self, float p=0.5):
        THFloatTensor_bernoulli(self.thFloatTensor, globalState.generator, p)
        return self

    def geometric(_FloatTensor self, float p=0.5):
        THFloatTensor_geometric(self.thFloatTensor, globalState.generator, p)
        return self


    def __mul__(_FloatTensor self, _FloatTensor M2):
        cdef _FloatTensor T = _FloatTensor.new()
        cdef _FloatTensor res = _FloatTensor.new()
        cdef int resRows = THFloatTensor_size(self.thFloatTensor, 0)
        cdef int resCols = THFloatTensor_size(M2.thFloatTensor, 1)
        res.resize2d(resRows, resCols)
        T.resize2d(resRows, resCols)
        THFloatTensor_addmm(res.thFloatTensor, 0, T.thFloatTensor, 1, self.thFloatTensor, M2.thFloatTensor)
        return res

    def normal(_FloatTensor self, float mean=0, float stdv=1):
        THFloatTensor_normal(self.thFloatTensor, globalState.generator, mean, stdv)
        return self

    def exponential(_FloatTensor self, float _lambda=1):
        THFloatTensor_exponential(self.thFloatTensor, globalState.generator, _lambda)
        return self

    def cauchy(_FloatTensor self, float median=0, float sigma=1):
        THFloatTensor_cauchy(self.thFloatTensor, globalState.generator, median, sigma)
        return self

    def logNormal(_FloatTensor self, float mean=1, float stdv=2):
        THFloatTensor_logNormal(self.thFloatTensor, globalState.generator, mean, stdv)
        return self

    def uniform(_FloatTensor self, float a=0, float b=1):
        THFloatTensor_uniform(self.thFloatTensor, globalState.generator, a, b)
        return self


#    @staticmethod
cdef _FloatTensor_fromNative(THFloatTensor *tensorC, retain=True):
    if retain:
        THFloatTensor_retain(tensorC)
    tensor = _FloatTensor(_allocate=False)
    tensor.thFloatTensor = tensorC
    return tensor



cdef class _LongTensor(object):
    # properties are in the PyTorch.pxd file

#    def __cinit__(Tensor self, THFloatTensor *tensorC = NULL):
#        self.thFloatTensor = tensorC

    def __cinit__(self, *args, _allocate=True):
#        print('LongTensor.__cinit__')
#        cdef THLongStorage *storageC
#        cdef long addr
#        if len(kwargs) > 0:
#            raise Exception('cannot provide arguments to initializer')
        if _allocate:
#            if len(args) == 1 and isinstance(args[0], _LongTensor):  # it's a size tensor
#                self.thFloatTensor = THFloatTensor_new()
            for arg in args:
                if not isinstance(arg, int):
                    raise Exception('cannot provide arguments to initializer')
            if len(args) == 0:
#                print('no args, calling THLongTensor_new()')
                self.thLongTensor = THLongTensor_new()
            elif len(args) == 1:
#                print('new tensor 1d length', args[0])
                self.thLongTensor = THLongTensor_newWithSize1d(args[0])
#                storageC = THFloatTensor_storage(self.thFloatTensor)
#                if storageC == NULL:
#                    print('storageC is NULL')
#                else:
#                    print('storageC not null')
#                    addr = <long>(storageC)
#                    print('storageaddr', hex(addr))
#                    print('storageC refcount', THFloatStorage_getRefCount(storageC))
            elif len(args) == 2:
                self.thLongTensor = THLongTensor_newWithSize2d(args[0], args[1])
            else:
                raise Exception('Not implemented, len(args)=' + str(len(args)))

#    def __cinit__(self, THFloatTensor *tensorC, Storage storage):
#        self.thFloatTensor = tensorC
#        self.storage = storage

#    def __cinit__(self, Storage storage, offset, size0, stride0, size1, stride1):
#        self.thFloatTensor = THFloatTensor_newWithStorage2d(storage.thFloatStorage, offset, size0, stride0, size1, stride1)
#        self.storage = storage

    def __dealloc__(self):
        cdef int refCount
#        cdef int dims
#        cdef int size
#        cdef int i
#        cdef THFloatStorage *storage
        refCount = THLongTensor_getRefCount(self.thLongTensor)
#        print('LongTensor.dealloc old refcount', refCount)
#        storage = THFloatTensor_storage(self.thFloatTensor)
#        if storage == NULL:
#            print('   dealloc, storage NULL')
#        else:
#            print('   dealloc, storage ', hex(<long>(storage)))
#        dims = THFloatTensor_nDimension(self.thFloatTensor)
#        print('   dims of dealloc', dims)
#        for i in range(dims):
#            print('   size[', i, ']', THFloatTensor_size(self.thFloatTensor, i))
        if refCount < 1:
            raise Exception('Unallocated an already deallocated tensor... :-O')  # Hmmm, seems this exceptoin wont go anywhere useful... :-P
        THLongTensor_free(self.thLongTensor)

    def nElement(_LongTensor self):
        return THLongTensor_nElement(self.thLongTensor)

    @property
    def refCount(_LongTensor self):
        return THLongTensor_getRefCount(self.thLongTensor)

    cpdef int dims(self):
        return THLongTensor_nDimension(self.thLongTensor)

    cpdef set1d(self, int x0, long value):
        THLongTensor_set1d(self.thLongTensor, x0, value)

    cpdef set2d(self, int x0, int x1, long value):
        THLongTensor_set2d(self.thLongTensor, x0, x1, value)

    cpdef long get1d(self, int x0):
        return THLongTensor_get1d(self.thLongTensor, x0)

    cpdef long get2d(self, int x0, int x1):
        return THLongTensor_get2d(self.thLongTensor, x0, x1)

    def __repr__(_LongTensor self):
        # assume 2d matrix for now
        cdef int size0
        cdef int size1
        dims = self.dims()
        if dims == 0:
            return '[torch.LongTensor with no dimension]\n'
        elif dims == 2:
            size0 = THLongTensor_size(self.thLongTensor, 0)
            size1 = THLongTensor_size(self.thLongTensor, 1)
            res = ''
            for r in range(size0):
                thisline = ''
                for c in range(size1):
                    if c > 0:
                        thisline += ' '
                    
                    thisline += str(self.get2d(r,c),)
                    
                res += thisline + '\n'
            res += '[torch.LongTensor of size ' + ('%.0f' % size0) + 'x' + str(size1) + ']\n'
            return res
        elif dims == 1:
            size0 = THLongTensor_size(self.thLongTensor, 0)
            res = ''
            thisline = ''
            for c in range(size0):
                if c > 0:
                    thisline += ' '
                
                thisline += str(self.get1d(c))
                
            res += thisline + '\n'
            res += '[torch.LongTensor of size ' + str(size0) + ']\n'
            return res
        else:
            raise Exception("Not implemented: dims > 2")

    def __getitem__(_LongTensor self, int index):
        if self.dims() == 1:
            return self.get1d(index)
        cdef THLongTensor *res = THLongTensor_newSelect(self.thLongTensor, 0, index)
        return _LongTensor_fromNative(res, False)

    def __setitem__(_LongTensor self, int index, long value):
        if self.dims() == 1:
            self.set1d(index, value)
        else:
            raise Exception("not implemented")

    def fill(_LongTensor self, long value):
        THLongTensor_fill(self.thLongTensor, value)
        return self

    def size(_LongTensor self):
        cdef int dims = self.dims()
        cdef _LongTensor size
        if dims > 0:
            size = _LongTensor(dims)
            for d in range(dims):
                size.set1d(d, THLongTensor_size(self.thLongTensor, d))
            return size
        else:
            return None  # not sure how to handle this yet

    @staticmethod
    def new():
#        print('allocate tensor')
        return _LongTensor()
#        return _FloatTensor_fromNative(newTensorC, False)

    def __add__(_LongTensor self, long value):
        # assume 2d matrix for now?
        cdef _LongTensor res = _LongTensor.new()
#        THFloatTensor_resizeAs(cresult, self.thFloatTensor)
        THLongTensor_add(res.thLongTensor, self.thLongTensor, value)
        return res

    def narrow(_LongTensor self, int dimension, long firstIndex, long size):
        cdef THLongTensor *narrowedC = THLongTensor_newNarrow(self.thLongTensor, dimension, firstIndex, size)
        return _LongTensor_fromNative(narrowedC, retain=False)

    def resize1d(_LongTensor self, int size0):
        THLongTensor_resize1d(self.thLongTensor, size0)
        return self

    def resize2d(_LongTensor self, int size0, int size1):
        THLongTensor_resize2d(self.thLongTensor, size0, size1)
        return self

    def resize3d(_LongTensor self, int size0, int size1, int size2):
        THLongTensor_resize3d(self.thLongTensor, size0, size1, size2)
        return self

    def resize4d(_LongTensor self, int size0, int size1, int size2, int size3):
        THLongTensor_resize4d(self.thLongTensor, size0, size1, size2, size3)
        return self

    def resize(_LongTensor self, _LongTensor size):
#        print('_FloatTensor.resize size:', size)
        if size.dims() == 0:
            return self
        cdef int dims = size.size()[0]
#        print('_FloatTensor.resize dims:', dims)
        if dims == 1:
            THLongTensor_resize1d(self.thLongTensor, size[0])
        elif dims == 2:
            THLongTensor_resize2d(self.thLongTensor, size[0], size[1])
        elif dims == 3:
            THLongTensor_resize3d(self.thLongTensor, size[0], size[1], size[2])
        elif dims == 4:
            THLongTensor_resize4d(self.thLongTensor, size[0], size[1], size[2], size[3])
        else:
            raise Exception('Not implemented for dims=' + str(dims))
        return self

    @staticmethod
    def newWithStorage1d(Storage.LongStorage storage, offset, size0, stride0):
#        print('allocate tensor')
        cdef THLongTensor *newTensorC = THLongTensor_newWithStorage1d(storage.thLongStorage, offset, size0, stride0)
        return _LongTensor_fromNative(newTensorC, False)

    @staticmethod
    def newWithStorage2d(Storage.LongStorage storage, offset, size0, stride0, size1, stride1):
#        print('allocate tensor')
        cdef THLongTensor *newTensorC = THLongTensor_newWithStorage2d(storage.thLongStorage, offset, size0, stride0, size1, stride1)
        return _LongTensor_fromNative(newTensorC, False)

    def storage(_LongTensor self):
        cdef Storage.THLongStorage *storageC = THLongTensor_storage(self.thLongTensor)
        if storageC == NULL:
            return None
        return Storage.LongStorage_fromNative(storageC)

    def __iadd__(_LongTensor self, long value):
        THLongTensor_add(self.thLongTensor, self.thLongTensor, value)
        return self

    # ========== random ===============================

    def bernoulli(_LongTensor self, float p=0.5):
        THLongTensor_bernoulli(self.thLongTensor, globalState.generator, p)
        return self

    def geometric(_LongTensor self, float p=0.5):
        THLongTensor_geometric(self.thLongTensor, globalState.generator, p)
        return self



#    @staticmethod
cdef _LongTensor_fromNative(THLongTensor *tensorC, retain=True):
    if retain:
        THLongTensor_retain(tensorC)
    tensor = _LongTensor(_allocate=False)
    tensor.thLongTensor = tensorC
    return tensor



def asFloatTensor(myarray):
    cdef float[:] myarraymv
    cdef Storage.FloatStorage storage
    if str(type(myarray)) == "<type 'numpy.ndarray'>":
        dims = len(myarray.shape)
        rows = myarray.shape[0]
        cols = myarray.shape[1]

        myarraymv = myarray.reshape(rows * cols)
        storage = Storage.FloatStorage.newWithData(myarraymv)
        Storage.THFloatStorage_retain(storage.thFloatStorage) # since newWithData takes ownership
        tensor = _FloatTensor.newWithStorage2d(storage, 0, rows, cols, cols, 1)
        return tensor
    elif isinstance(myarray, array.array):
        myarraymv = myarray
        storage = Storage.FloatStorage.newWithData(myarraymv)
        Storage.THFloatStorage_retain(storage.thFloatStorage) # since newWithData takes ownership
        tensor = _FloatTensor.newWithStorage1d(storage, 0, len(myarray), 1)
        return tensor        
    else:
        raise Exception("not implemented")

def asDoubleTensor(myarray):
    cdef double[:] myarraymv
    cdef Storage.DoubleStorage storage
    if str(type(myarray)) == "<type 'numpy.ndarray'>":
        dims = len(myarray.shape)
        rows = myarray.shape[0]
        cols = myarray.shape[1]

        myarraymv = myarray.reshape(rows * cols)
        storage = Storage.DoubleStorage.newWithData(myarraymv)
        Storage.THDoubleStorage_retain(storage.thDoubleStorage) # since newWithData takes ownership
        tensor = _DoubleTensor.newWithStorage2d(storage, 0, rows, cols, cols, 1)
        return tensor
    elif isinstance(myarray, array.array):
        myarraymv = myarray
        storage = Storage.DoubleStorage.newWithData(myarraymv)
        Storage.THDoubleStorage_retain(storage.thDoubleStorage) # since newWithData takes ownership
        tensor = _DoubleTensor.newWithStorage1d(storage, 0, len(myarray), 1)
        return tensor        
    else:
        raise Exception("not implemented")

cdef class GlobalState(object):
    # properties are in the PyTorch.pxd file

    def __cinit__(GlobalState self):
        pass
#        print('GlobalState.__cinit__')

    def __dealloc__(self):
        pass
#        print('GlobalState.__dealloc__')

    def getLua(self):
        return LuaState_fromNative(self.L)



def _popDoubleTensor():
    global globalState
    cdef THDoubleTensor *tensorC = popDoubleTensor(globalState.L)
    return _DoubleTensor_fromNative(tensorC)

def _pushDoubleTensor(_DoubleTensor tensor):
    global globalState
    pushDoubleTensor(globalState.L, tensor.thDoubleTensor)





def _popFloatTensor():
    global globalState
    cdef THFloatTensor *tensorC = popFloatTensor(globalState.L)
    return _FloatTensor_fromNative(tensorC)

def _pushFloatTensor(_FloatTensor tensor):
    global globalState
    pushFloatTensor(globalState.L, tensor.thFloatTensor)





# there's probably an official Torch way of doing this



cpdef int getDoublePrediction(_DoubleTensor output):
    cdef int prediction = 0
    cdef double maxSoFar = output[0]
    cdef double thisValue = 0
    cdef int i = 0
    for i in range(THDoubleTensor_size(output.thDoubleTensor, 0)):
        thisValue = THDoubleTensor_get1d(output.thDoubleTensor, i)
        if thisValue > maxSoFar:
            maxSoFar = thisValue
            prediction = i
    return prediction + 1







cpdef int getFloatPrediction(_FloatTensor output):
    cdef int prediction = 0
    cdef float maxSoFar = output[0]
    cdef float thisValue = 0
    cdef int i = 0
    for i in range(THFloatTensor_size(output.thFloatTensor, 0)):
        thisValue = THFloatTensor_get1d(output.thFloatTensor, i)
        if thisValue > maxSoFar:
            maxSoFar = thisValue
            prediction = i
    return prediction + 1






cdef GlobalState globalState

def getGlobalState():
    global globalState
    return globalState

def init():
    global globalState
    print('initializing PyTorch...')
    globalState = GlobalState()
    globalState.L = luaInit()
    globalState.generator = <THGenerator *>(getGlobal(globalState.L, 'torch', '_gen'))
    print('generator null:', globalState.generator == NULL)
    print(' ... PyTorch initialized')

init()

from floattensor import *

# ==== Nn ==================================
cdef class Nn(object):  # just used to provide the `nn.` syntax
    def collectgarbage(self):
        collectGarbage(globalState.L)

#    def Linear(self, inputSize, outputSize):
#        return Linear(inputSize, outputSize)