using Plots;
gr()

# The Rosenbrock function, also referred to as the Valley or the Banana function
# is a popular test problem for gradient-based optimization algorithms. It is shown
# in this plot in the two dimensional form.

# The function is unimodal, and the global minimum lies in a narrow, parabolic
# valley. However, even though this valley is easy to find, convergence to the
# minimum is difficult.

rosenbrock(x::Vector) = (x[1]-1.0)^2 + 100*(x[2]-x[1]^2)^2;

# Input Domain. The function is usually evaluated on the hyper-cube
# xᵢ ∈ [-2.048,2.048] for all i in 1,...,d

x = range(-2.048, stop=2.048, length=1000);
y= range(-2.048, stop=2.048, length=1000);

z = (x,y)->rosenbrock([x,y]);

# display(plot(x,y,z, linetype=:surface));
display(contour(x,y,z));
#display(contour(x,y,z,levels=[50,75,100,125,150,175]));
