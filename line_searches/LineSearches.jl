module LineSearches
    export  backtracking_line_search,
            exact_line_search

    include("backtracking_line_search.jl")
    include("exact_line_search.jl")
end
