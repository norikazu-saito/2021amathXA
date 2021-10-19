# Poisson equation
# 2021-09-15

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import numpy as np
from dolfin import *
    
# optimization options for the form compiler
parameters["form_compiler"]["cpp_optimize"] = True
parameters["form_compiler"]["optimize"] = True

# create mesh and define function space
#mesh = Mesh("lshaped2.xml")
mesh = Mesh("lshaped3.xml")
#mesh = Mesh("lshaped4.xml")
V = FunctionSpace(mesh, "CG", 1)

# element data 
nodes = mesh.coordinates();
elements = tri.Triangulation(nodes[:, 0], nodes[:, 1], mesh.cells());
# len( mesh.cells())): number of elements  
# mesh.cells(): list of elements   
# mesh.coordinates(): list of node points 

# define Dirichlet boundary
class DirichletBoundary(SubDomain):
    def inside(self, x, on_boundary):
        return on_boundary

# define boundary condition
u0 = Constant(0.0)
bc = DirichletBC(V, u0, DirichletBoundary())

# define trial and test functions
u = TrialFunction(V)
v = TestFunction(V)

# define right-hand side
f = Expression('5.0*exp(-10.0*((x[0]+0.5)*(x[0]+0.5)+(x[1]-0.5)*(x[1]-0.5)))',degree=4)

# solve Poisson 
a = inner(grad(u), grad(v))*dx
L = f*v*dx
u = Function(V)
solve(a == L, u, bc)

# convert function "u" into vector "solution_vec" 
solution_vec = u.compute_vertex_values(mesh)
print (max(solution_vec))
print (min(solution_vec))

# visualization
# bird's-eye view
fig1 = plt.figure(1)
ax = fig1.gca(projection='3d')
ax.plot_trisurf(nodes[:,0],nodes[:,1],solution_vec, cmap=plt.cm.Spectral, linewidth=0.1, antialiased=True)
# contour-line 
fig5 = plt.figure(5)
plt.gca().set_aspect('equal')
my_triangle = tri.Triangulation(nodes[:, 0], nodes[:, 1], mesh.cells())
plt.rcParams['image.cmap'] = 'plasma' #https://beiznotes.org/matplot-cmap-list/
#plt.rcParams['image.cmap'] = 'jet' #https://beiznotes.org/matplot-cmap-list/
plt.tripcolor(my_triangle, solution_vec,  shading='flat', vmin=-1.1e-5, vmax=0.04)
# delete colorbar
plt.colorbar()
# delete frameline
plt.gca().spines['right'].set_visible(False)
plt.gca().spines['top'].set_visible(False)
plt.gca().spines['left'].set_visible(False)
plt.gca().spines['bottom'].set_visible(False)
# delete scale
ax = plt.gca()
ax.axes.xaxis.set_visible(False)
ax.axes.yaxis.set_visible(False)
# plot 
plt.show()
# save
fig1.savefig("poisson2a.pdf")
fig5.savefig("poisson2b.pdf")
