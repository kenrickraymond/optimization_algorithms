function secant(f, x₀::Float64, x₁::Float64, ϵ)
    # In Secant method, x(k+1) is the stationary point of a quadratic function that
    # fits f' at x(k) and x(k-1)

    function D(f,a)
        # Approximate the first derivative using central differences
        h = 0.001
        return (f(a + h) - f(a - h))/(2 * h)
    end

    x = Array{Float64}(undef, 200)
    k = 3

    x[1] = x₀
    x[2] = x₁
    x[3] = x[2] - D(f,x[2])*((x[2] - x[1])/(D(f,x[2]) - D(f,x[1])))

    while (abs(x[k] - x[k-1]) > ϵ)
        x[k+1] = x[k] - D(f,x[k])*((x[k] - x[k-1])/(D(f,x[k]) - D(f,x[k-1])))
        k = k + 1
    end

    return x[k]
end
