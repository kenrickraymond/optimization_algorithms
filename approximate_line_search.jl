using Calculus
using LinearAlgebra

function backtracking_line_search(f, ∇f, x, d, α; ρ=0.5, β=1e-4)
    ρ = 0.90
    ϕ(α) = f(x .+ α .* d)
    l(α) = f(x) + β * α * (∇f(x) ⋅ d)

    while (ϕ(α) <= l(α))  # First Wolfe condition
        α = ρ * α
    end
    return α
end



f(x) = x[1]^2 + x[1]*x[2] + x[2]^2

xₖ = [1,2]    # kth iterate
d = [-1,-1]  # descent direction vector
α = 10       # maximum step-size
β = 1e-4     # first Wolfe condition parameter
ρ = 0.5      # Reduction factor

∇f(x) = Calculus.finite_difference(f, x,:central)

a = backtracking_line_search(f, ∇f, xₖ, d, α; ρ, β)
