import os
import sys, pandas as pd, pprint
import pandas.api
from numpy import NaN

list0 = [1, 'test']
key0 = tuple(list0)
value0 = [2, "test"]
key3 = int()
dict0 = { key0: value0}
dict0 = {"key1": "value1"}
dict0 = {
    "key1": "value1",
    "key2": "value2",
    key3: 19.64
}

z = dict0.items()
z = dict0.setdefault("key1", "value0")

key4 = tuple([1, 2])

# comment
# second comment
class class0:
    a1 = 1

    def seta(self, a1):
        a = a1 * 2
        print(a)
        return a


def func0():
    return


def func1(x):
    y = 2 * x
    z = 5 * y
    return z


def func2(x):
    l = lambda x: x + 1
    x = l(x)
    for i in range(10):
        i = i + 1
    func1(x)
    func0()
    return x


x = 1
cls0 = class0()
cls0.a1 = 3
print("func1:", func1(x))
print("func2:", func2(x))
print("class:", cls0.seta(x))
