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

D1 = Int[
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 0 1 0 0
    0 0 0 0 0 0 1 0
    0 0 0 0 0 0 0 1
]

D2 = Int[
    3 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 3 0 0 0 0
    0 0 0 0 3 0 0 0
    0 0 0 0 0 3 0 0
    0 0 0 0 0 0 3 0
    0 0 0 0 0 0 0 3
]

D3 = Int[
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 0 1 0 0
    0 0 0 0 0 0 1 0
    0 0 0 0 0 0 0 1
]

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

# returns all vectors with norm k (k should be a nonnegative even integer)
function search(k::Int, S::Matrix{Complex{Int}}, D::Matrix{Int}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    @assert ishermitian(S)
    @assert isposdef(S)
    @assert isdiag(D)
    @assert istriu(L)
    @assert istriu(Li)
    @assert L' * D * L == d * S
    @assert Li * L == d * I
    @assert L * Li == d * I
    normbound = d * k
    zlist = Complex{Int}[]
    for x in range(-normbound, normbound)
        for y in range(-normbound, normbound)
            z = x + y * im
            if abs2(z) ≤ normbound
                push!(zlist, z)
            end
        end
    end
    Glist = Vector{Vector{Complex{Int}}}()
    for z8 in zlist
        if D[8,8] * abs2(z8) > normbound
            continue
        end
        if (Li[8,8] * z8) % d != 0
            continue
        end
        for z7 in zlist
            if D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                continue
            end
            if (Li[7,7] * z7 + Li[7,8] * z8) % d != 0
                continue
            end
            for z6 in zlist
                if D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                    continue
                end
                if (Li[6,6] * z6 + Li[6,7] * z7 + Li[6,8] * z8) % d != 0
                    continue
                end
                for z5 in zlist
                    if D[5,5] * abs2(z5) + D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                        continue
                    end
                    if (Li[5,5] * z5 + Li[5,6] * z6 + Li[5,7] * z7 + Li[5,8] * z8) % d != 0
                        continue
                    end
                    for z4 in zlist
                        if D[4,4] * abs2(z4) + D[5,5] * abs2(z5) + D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                            continue
                        end
                        if (Li[4,4] * z4 + Li[4,5] * z5 + Li[4,6] * z6 + Li[4,7] * z7 + Li[4,8] * z8) % d != 0
                            continue
                        end
                        for z3 in zlist
                            if D[3,3] * abs2(z3) + D[4,4] * abs2(z4) + D[5,5] * abs2(z5) + D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                                continue
                            end
                            if (Li[3,3] * z3 + Li[3,4] * z4 + Li[3,5] * z5 + Li[3,6] * z6 + Li[3,7] * z7 + Li[3,8] * z8) % d != 0
                                continue
                            end
                            for z2 in zlist
                                if D[2,2] * abs2(z2) + D[3,3] * abs2(z3) + D[4,4] * abs2(z4) + D[5,5] * abs2(z5) + D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) > normbound
                                    continue
                                end
                                if (Li[2,2] * z2 + Li[2,3] * z3 + Li[2,4] * z4 + Li[2,5] * z5 + Li[2,6] * z6 + Li[2,7] * z7 + Li[2,8] * z8) % d != 0
                                    continue
                                end
                                for z1 in zlist
                                    if D[1,1] * abs2(z1) + D[2,2] * abs2(z2) + D[3,3] * abs2(z3) + D[4,4] * abs2(z4) + D[5,5] * abs2(z5) + D[6,6] * abs2(z6) + D[7,7] * abs2(z7) + D[8,8] * abs2(z8) != normbound
                                        continue
                                    end
                                    if (Li[1,1] * z1 + Li[1,2] * z2 + Li[1,3] * z3 + Li[1,4] * z4 + Li[1,5] * z5 + Li[1,6] * z6 + Li[1,7] * z7 + Li[1,8] * z8) % d != 0
                                        continue
                                    end
                                    LG = [z1, z2, z3, z4, z5, z6, z7, z8]
                                    dG = Li * LG
                                    G = dG ÷ d
                                    @assert d * G == dG
                                    @assert G' * S * G == k
                                    push!(Glist, G)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return Glist
end

function compute(S::Matrix{Complex{Int}}, D::Matrix{Int}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    Glist = search(2, S, D, L, Li, d)
    a4 = 0
    i = 0
    for G1 in Glist
        amt = 0
        for G2 in Glist
            if G1' * S * G2 != 0
                continue
            end
            for G3 in Glist
                if G1' * S * G3 != 0
                    continue
                end
                if G2' * S * G3 != 0
                    continue
                end
                amt += 1
                
            end
        end
        val = 0
        for G4 in Glist
            x = G1' * S * G4
            val += x * x * x * x
        end
        a4 += amt * val
        i += 1
        println("status ", d, ": ", i, " ", amt, " ", val)
    end
    return a4
end

function compute()
    return 8 * compute(S1, D1, L1, Li1, d1) - 15 * compute(S2, D2, L2, Li2, d2) + 7 * compute(S3, D3, L3, Li3, d3)
end

println(compute())