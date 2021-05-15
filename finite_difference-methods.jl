function diff_forward(f,x::Real;h=sqrt(eps(Float64)))
    return (f(x + h) - f(x))/h;
end

function diff_central(f,x::Real;h=cbrt(eps(Float64)))
    return (f(x + h/2) - f(x-h/2))/h
end

function diff_backward(f,x::Real;h=sqrt(eps(Float64)))
    return (f(x) - f(x-h))/h
end
