struct Pt
    x
    y
end

# Geometrically this function gives the intersection of a pair of lines:
#  L₁: Straight line with slope -l passing through A(A.x, A.y)
#  L₂: Straight line with slope l passing through B(B.x, B.y)

# The coordinates of the intersection point are given by
# x = ((A.y - B.y) + l(A.x + B.x))/2l
# y = (A.y + B.y)/2 + l(A.x - B.x)/2

function _get_sp_intersection(A, B, l)
    t = ((A.y - B.y) - l*(A.x - B.x))/(2*l)
    return Pt(A.x + t, A.y - t*l)
end

function shubert_piyavskii(f, a, b, l, ϵ)
    x₀ = (a + b)/2
    y₀ = f(x₀)

    A = Pt(a, f(a))
    M = Pt(x₀,y₀)
    B = Pt(b, f(b))

    Pₗ = _get_sp_intersection(A, M, l)
    Pᵣ = _get_sp_intersection(M, B, l)

    pts = [A, Pᵣ, M, Pₗ, B]

    Δ = Inf

    while (Δ > ϵ)
        i = argmin([P.y for P in pts])
        P = Pt(pts[i].x, f(pts[i].x))

        Δ = P.y - pts[i].y

        Pₗ = _get_sp_intersection(pts[i-1], P, l)
        Pᵣ = _get_sp_intersection(P, pts[i+1], l)

        deleteat!(pts, i)
        insert!(pts, i, Pᵣ)
        insert!(pts, i, P)
        insert!(pts, i, Pₗ)
    end

    # Every odd point 1,3,5, correspond to upper vertices in the sawtooth.
    i = 2*(argmin([P.y for P in pts[1:2:end]])) - 1
    return pts[i]
end
