using LinearAlgebra

S1 = Complex{Int}[
    2  0  0  0  1  1  0  1
    0  2  0  0 -1  1 -1  0
    0  0  2  0  0  1  1 -1
    0  0  0  2 -1  0  1  1
    1 -1  0 -1  2  0  0  0
    1  1  1  0  0  2  0  0
    0 -1  1  1  0  0  2  0
    1  0 -1  1  0  0  0  2
]

S2 = Complex{Int}[
       2   -1    0   -1   -1   -1  -im 1+im
      -1    2 1-im    0    0    0    0  -im
       0 1+im    2    0    0    0    0    1
      -1    0    0    2    1    1   im   -1
      -1    0    0    1    2    1   im   -1
      -1    0    0    1    1    2   im   -1
      im    0    0  -im  -im  -im    2   im
    1-im   im    1   -1   -1   -1  -im    4
]

S3 = Complex{Int}[
       2    0 1+im   im    0    0    0    0
       0    2   im 1-im    0    0    0    0
    1-im  -im    2    0    0    0    0    0
     -im 1+im    0    2    0    0    0    0
       0    0    0    0    2    0 1+im   im
       0    0    0    0    0    2   im 1-im
       0    0    0    0 1-im  -im    2    0
       0    0    0    0  -im 1+im    0    2
]

d1 = 2

d2 = 6

d3 = 2

D1 = diagm([1, 1, 1, 1, 1, 1, 1, 1])

D2 = diagm([3, 1, 1, 3, 3, 3, 3, 3])

D3 = diagm([1, 1, 1, 1, 1, 1, 1, 1])

L1 = Complex{Int}[
    2  0  0  0  1  1  0  1
    0  2  0  0 -1  1 -1  0
    0  0  2  0  0  1  1 -1
    0  0  0  2 -1  0  1  1
    0  0  0  0  1  0  0  0
    0  0  0  0  0  1  0  0
    0  0  0  0  0  0  1  0
    0  0  0  0  0  0  0  1
]

L2 = Complex{Int}[
    2    -1     0    -1    -1    -1   -im  1+im
    0     3 2-2im    -1    -1    -1   -im  1-im
    0     0     2  1+im  1+im  1+im -1+im     1
    0     0     0  1+im     0     0     0    -1
    0     0     0     0  1+im     0     0    -1
    0     0     0     0     0  1+im     0    -1
    0     0     0     0     0     0  1-im     1
    0     0     0     0     0     0     0     1
]

L3 = Complex{Int}[
    2    0 1+im   im    0    0    0    0
    0    2   im 1-im    0    0    0    0
    0    0    1    0    0    0    0    0
    0    0    0    1    0    0    0    0
    0    0    0    0    2    0 1+im   im
    0    0    0    0    0    2   im 1-im
    0    0    0    0    0    0    1    0
    0    0    0    0    0    0    0    1
]

Li1 = Complex{Int}[
    1  0  0  0 -1 -1  0 -1
    0  1  0  0  1 -1  1  0
    0  0  1  0  0 -1 -1  1
    0  0  0  1  1  0 -1 -1
    0  0  0  0  2  0  0  0
    0  0  0  0  0  2  0  0
    0  0  0  0  0  0  2  0
    0  0  0  0  0  0  0  2
]

Li2 = Complex{Int}[
    3       1   -1+im   3-3im   3-3im   3-3im  -3+3im  9-15im
    0       2  -2+2im   3-3im   3-3im   3-3im  -3+3im 12-12im
    0       0       3      -3      -3      -3       3     -15
    0       0       0   3-3im       0       0       0   3-3im
    0       0       0       0   3-3im       0       0   3-3im
    0       0       0       0       0   3-3im       0   3-3im
    0       0       0       0       0       0   3+3im  -3-3im
    0       0       0       0       0       0       0       6
]

Li3 = Complex{Int}[
    1     0 -1-im   -im     0     0     0     0
    0     1   -im -1+im     0     0     0     0
    0     0     2     0     0     0     0     0
    0     0     0     2     0     0     0     0
    0     0     0     0     1     0 -1-im   -im
    0     0     0     0     0     1   -im -1+im
    0     0     0     0     0     0     2     0
    0     0     0     0     0     0     0     2
]

function Base.:÷(z::Complex{Int}, m::Int)
    return Complex(z.re ÷ m, z.im ÷ m)
end

function Base.:÷(M::Vector{Complex{Int}}, m::Int)
    return M .÷ m
end

function Base.:%(z::Complex{Int}, m::Int)
    return Complex(mod(z.re, m), mod(z.im, m))
end

function Base.:%(M::Vector{Complex{Int}}, m::Int)
    return M .% m
end

# Returns all vectors G with G' * S * G = k (k should be a nonnegative even integer)
function search(k::Int, S::Matrix{Complex{Int}}, D::Matrix{Int}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    # Verify the Cholesky decomposition S = L' * D * L / d
    @assert ishermitian(S)
    @assert isposdef(S)
    @assert isdiag(D)
    @assert istriu(L)
    @assert istriu(Li)
    @assert L' * D * L == d * S
    @assert Li * L == d * I
    @assert L * Li == d * I
    # Find all vectors z with abs2(z) ≤ d * k
    normbound = d * k
    zlist = Vector{Complex{Int}}()
    for x in range(-normbound, normbound)
        for y in range(-normbound, normbound)
            z = x + y * im
            if abs2(z) ≤ normbound
                push!(zlist, z)
            end
        end
    end
    # Find all vectors LG with LG' * D * LG = d * k
    LGlist = Vector{Vector{Complex{Int}}}()
    push!(LGlist, Vector{Complex{Int}}())
    for i in 1 : 8
        nLGlist = Vector{Vector{Complex{Int}}}()
        for LG in LGlist
            for z in zlist
                nLG = copy(LG)
                pushfirst!(nLG, z)
                if sum(Li[9 - i, 8 - i + j] * nLG[j] for j in 1 : i) % d != 0
                    continue
                end
                norm = sum(D[8 - i + j, 8 - i + j] * abs2(nLG[j]) for j in 1 : i)
                if norm > normbound
                    continue
                end
                if i == 8 && norm != normbound
                    continue
                end
                push!(nLGlist, nLG)
            end
        end
        LGlist = nLGlist
    end
    # Find all vectors G with G' * S * G = k
    Glist = Vector{Vector{Complex{Int}}}()
    for LG in LGlist
        dG = Li * LG
        G = dG ÷ d
        @assert d * G == dG
        @assert G' * S * G == k
        push!(Glist, G)
    end
    return Glist
end

# Returns a Fourier coefficient of the Hermitian theta series arising from S = L' * D * L / d
function compute(S::Matrix{Complex{Int}}, D::Matrix{Int}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    Glist = search(2, S, D, L, Li, d)
    perp = Dict{Vector{Complex{Int}},Set{Vector{Complex{Int}}}}()
    for G1 in Glist
        perp[G1] = Set{Vector{Complex{Int}}}()
        for G2 in Glist
            if G1' * S * G2 == 0
                push!(perp[G1], G2)
            end
        end
    end
    sum = 0
    for G1 in Glist
        amt = 0
        for G2 in perp[G1]
            amt += length(perp[G1] ∩ perp[G2])
        end
        val = 0
        for G4 in Glist
            x = G4' * S * G1
            val += x * x * x * x
        end
        sum += amt * val
    end
    return sum
end

function compute()
    return 8 * compute(S1, D1, L1, Li1, d1) - 15 * compute(S2, D2, L2, Li2, d2) + 7 * compute(S3, D3, L3, Li3, d3)
end

println(compute())