using LinearAlgebra
using Calculus

function backtracking_line_search(f, ∇f, x, d, α; ρ=0.5, β=1e-4)
    ϕ(α) = f(x .+ α .* d)
    l(α) = f(x) + β * α * dot(∇f(x),d)

    while (ϕ(α) > l(α))  # First Wolfe condition
        α = ρ * α
    end
    return α
end
