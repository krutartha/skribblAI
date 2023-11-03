#!/usr/bin/env python
import tensorflow as tf

from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())


x1 = tf.constant([1, 2, 3, 4])

x2 = tf.constant([5, 6, 7, 8])

result = tf.multiply(x1, x2)

print(result)
