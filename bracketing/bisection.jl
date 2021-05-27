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
