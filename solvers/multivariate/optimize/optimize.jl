function optimize(f::F,
    initial_x::Tx,
    method::M,
    options::Options()) where {F<:AbstractObjective, M<:AbstractOptimizer, Tx<:AbstractArray}
    x_converged, f_converged, g_converged = false, false, false

    state = initial_state(method, f, initial_x)
    f_converged, g_converged = initial_convergence(f, state, method, initial_x)
    converged = f_converged || g_converged
    iteration = 0

    while !converged && iteration < options.iterations
        iteration += 1
        ls_success = 
    end
end
