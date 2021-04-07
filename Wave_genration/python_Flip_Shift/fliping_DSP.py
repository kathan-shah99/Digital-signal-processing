
"""
Created on Sat Dec 26 10:13:01 2020

@author: kathan
"""
import numpy as np
from matplotlib import pyplot as plt
"""
#-----------Flip signal------------------
x = np.array([3,5,7,2,0,1,4,9])
#x_rand = random(1,5)
#n = np.arange(1,8,1)

y = np.flip(x)

plt.subplot(2,1,1)
plt.plot(x)
plt.title('original')

plt.subplot(2,1,2)
plt.plot(y)
plt.title('Flipped')
"""
#------------------Shifting Signal------------------
d = int(input('delay'))
x = np.array([3,5,2,1,4,9])
x_pad = np.pad(x,(d,),'constant',constant_values = (0))

y_r = np.zeros(len(x_pad))
y_l = np.zeros(len(x_pad))

for n in range(len(x_pad)-d):
    y_l[n] = x_pad[n+d]

for n in range(len(x)):
    y_r[n+2*d] = x_pad[n+d]
    
plt.subplot(3,1,1)
plt.stem(x)
print(x)
plt.title('original')

plt.subplot(3,1,2)
plt.stem(y_r)
print(y_r)
plt.title('right shifted')

plt.subplot(3,1,3)
plt.stem(y_l)
print(y_l)
plt.title('left shifted')


