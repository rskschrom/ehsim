import numpy as np
import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt

# open file
data = np.genfromtxt('out.txt')
hx = data[:,0]
hy = data[:,1]
ez = data[:,2]
print hy.shape

ns = 280
hx.shape = (ns,ns)
hy.shape = (ns,ns)
ez.shape = (ns,ns)
print ez.shape

# plot
plt.pcolormesh(ez, cmap='bwr')
plt.colorbar()
plt.savefig('ehsim.png')
