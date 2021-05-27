using Calculus
using LinearAlgebra
using ForwardDiff

abstract type FirstOrderOptimizer end

struct GradientDescent <: FirstOrderOptimizer
    alphaguess
    linesearch
end

init!(M::GradientDescent, f, ∇f, x) = M

function step!(M::GradientDescent, f, ∇f, xₖ)
    # Normalized descent direction
    dₖ = -∇f(x)/norm(∇f(x), p=2)

    # Find αₖ such that the univariate function ϕₖ(α) = f(xₖ - α⋅∇f(xₖ)) is minimized.
    # Jagged search paths result if we choose a step-size that leads to the
    # maximal decrease in f. In fact, the next direction will always be orthogonal
    # to the current direction.

    # As exact line searches can be costly, we are satisfied by an approximate line
    # search, such that the Armijo condition is met.
    αₖ = backtracking_line_search(f, ∇f, xₖ, dₖ, 1e2)
    return xₖ .+ αₖ .* dₖ
end

"""
# Gradient Descent
## Constructor
GradientDescent(; alphaguess = LineSearches.InitialArmijo(), linesearch = LineSearches.Armijo())

## Description
The `GradientDescent` method is a simple descent algorithm, in which the search
direction is simply the negative gradient of the current iterate, and then a line-search
step is used to compute the step-size αₖ. See Chong and Zak (Ch 8.2) for an explanation of
the approach.

## References
 - Chong, Edwin K.P. and Zak, Stanislaw H., An introduction to Optimization. Wiley Publications
"""
function GradientDescent(f, x₀, ϵ=1e-5)
    # Gradient descent requires an initial point. The minimizer obtained is determined
    # by the initial point. Thus, the gradient descent algorithm may get stuck
    # in suboptimal local minima.
    ∇f(x) = ForwardDiff.gradient(f, x)
    gradDescent = init!(GradientDescent(), f, ∇f, x₀)
    x₁ = step!(gradDescent, f, ∇f, x₀)

    X = Vector{Float64}()
    push!(X, x₀)
    push!(X, x₁)

    k = 1
    while(abs((f(X[k+1]) - f(X[k]))/f(X[k])) < ϵ)
        x  = step!(gradDescent, f, ∇f, x₁)
        push!(X, x)
    end
end
