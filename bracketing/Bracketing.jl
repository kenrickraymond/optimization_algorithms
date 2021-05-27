__precompile__()

module Bracketing

using Printf

export  bracket_minimum,
        bisection,
        fbs,
        gss,
        newton,
        secant,
        shubert_piyavskii
        
# Initial guess methods
include("bracket_minimum.jl")

# Different bracketing methods
include("shubert_piyavskii.jl")
include("golden_section.jl")
include("fibonacci_search.jl")
include("newton.jl")
include("secant.jl")
include("bisection.jl")

end
