using SymEngine

@vars x;        # define x as a symbolic variable
f = x^2 + x/2 - sin(x)/x;
diff(f,x)
