using Bracketing

function exact_line_search(f, x, d)
    objective(α) = f(x .+ α .* d)
    a, b = bracket_minimum(objective)
    α₀,α₁ = bisection(objective, a, b, 1e-5)
    α = (α₀ + α₁)/2
    return α, x .+ α .* d
end
