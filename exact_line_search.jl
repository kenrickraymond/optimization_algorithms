using LinearAlgebra

function bracket_minimum(f, x = 0, s = 1e-2, k = 2.0)
    a, fa = x, f(x)
    b, fb = x + s, f(x + s)

    if(fb > fa)
        a, b = b, a
        fa, fb = fb, fa
        s = -s
    end

    while(true)
        c, fc = b + s, f(b + s)
        if(fb < fc)
            return a < c ? (a, c) : (c, a)
        else
            a, fa, b, fb = b, fb, c, fc
            s *= k
        end
    end
end

function bisection(f, a₀, b₀, ϵ)

    function D(f,a)
        # Approximate the first derivative using central differences
        h = 0.001
        return (f(a + h) - f(a - h))/(2 * h)
    end

    a = a₀
    b = b₀

    while((b - a) > ϵ)
        c = (a + b)/2.0

        if D(f,c) > 0
            b = c
        else
            a = c
        end
    end

    return (a,b)
end

function line_search(f::Function, x::Vector{Float64}, d::Vector{Float64})
    println("Hello")
    # objective = α -> f(x + α*d)
    #a, b = bracket_minimum(objective)
    #α = bisection(objective, a, b, 1e-5)
    # return α, x + α*d
end

f(x) = sin(x[1] * x[2]) + exp(x[2] + x[3]) - x[3]

x = [1,2,3]
d = [0, -1, -1]
α, x_min = line_search(f, x, d)
