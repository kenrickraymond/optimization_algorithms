function newton(f, x₀::Float64, ϵ)
    # In Newton's method, x(k+1) is the stationary point of a quadratic function that
    # fits f' and f'' at x(k)

    function D(f,a)
        # Approximate the first derivative using central differences
        h = 0.001
        return (f(a + h) - f(a - h))/(2 * h)
    end

    function D2(f,a)
        # Approximate the second derivative using central differences
        h = 0.001
        return (f(a + 2*h) - 2 * f(a) + f(a - 2*h))/(4*h^2)
    end

    x = Array{Float64}(undef, 200)
    k = 2

    x[1] = x₀
    x[2] = x[1] - D(f,x[1])/D2(f,x[1])

    while (abs(x[k] - x[k-1]) > ϵ)
        x[k+1] = x[k] - D(f,x[k])/D2(f,x[k])
        k = k + 1
    end

    return x[k]
end
