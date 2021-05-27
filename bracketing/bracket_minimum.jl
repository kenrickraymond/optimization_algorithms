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
