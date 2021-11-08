import matplotlib.pyplot as plt
import numpy as np
import math


t2 = np.arange(-10.0, 50.0, 0.02)
print(t2)
plt.plot(t2, np.exp(t2)*np.log(1+np.exp(t2*(-1))), 'r--')
plt.xlabel('x')
plt.ylabel('y')
plt.show()