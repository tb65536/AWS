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

# Build up G row by row, checking to make sure that the congruence conditions are satisfied
# Keep track of T so far, and Li G so far

function Base.:%(z::Complex{Int}, m::Int)
    return Complex(mod(z.re, m), mod(z.im, m))
end

function Base.:%(M::Matrix{Complex{Int}}, m::Int)
    return M .% m
end

function run(n::Int, tracebound::Int, S::Matrix{Complex{Int}}, D::Matrix{Int}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    @assert ishermitian(S)
    @assert isposdef(S)
    @assert isdiag(D)
    @assert istriu(L)
    @assert istriu(Li)
    @assert L' * D * L == d * S
    @assert Li * L == d * I
    @assert L * Li == d * I
    m0 = Dict{Pair{Matrix{Complex{Int}}, Matrix{Complex{Int}}}, BigInt}() # (G' D G = d T, Li G (mod d)) ↦ a
    m0[Pair(zeros(Complex{Int}, n, n), zeros(Complex{Int}, 8, n))] = 1
    for i in 8:-1:1
        m1 = Dict{Pair{Matrix{Complex{Int}}, Matrix{Complex{Int}}}, BigInt}()
        for ((dT, LiG), a) in m0
            bound = d * tracebound
            for j in 1:n
                bound -= convert(Int, dT[j, j])
            end
            bound ÷= D[i, i]
            s = isqrt(bound)
            possibilities = [[] for j in 1:n]
            for x in -s:s
                for y in -s:s
                    z = x + y * im
                    if abs2(z) > bound
                        continue
                    end
                    for j in 1:n
                        if (LiG[i, j] + Li[i, i] * z) % d == 0
                            push!(possibilities[j], z)
                        end
                    end
                end
            end
            @assert n == 4
            for z1 in possibilities[1]
                for z2 in possibilities[2]
                    for z3 in possibilities[3]
                        for z4 in possibilities[4]
                            if abs2(z1) + abs2(z2) + abs2(z3) + abs2(z4) > bound
                                continue
                            end
                            G = Complex{Int}[z1 z2 z3 z4]
                            ndT = dT + G' * D[i, i] * G
                            nG = zeros(Complex{Int}, 8, 4)
                            nG[i, :] = G
                            nLiG = (LiG + Li * nG) % d
                            p = Pair(ndT, nLiG)
                            m1[p] = get(m1, p, 0) + a
                        end
                    end
                end
            end
        end
        m0 = m1
    end
    m = Dict{Matrix, BigInt}() # T ↦ a
    for ((dT, LiG), a) in m0

    end
    return m
end

function run(n::Int, tracebound::Int)
    m1 = run(4, 2, S1, D1, L1, Li1, d1)
    m2 = run(4, 2, S2, D2, L2, Li2, d2)
    m3 = run(4, 2, S3, D3, L3, Li3, d3)
    m4 = Dict{Matrix{Complex{Int}}, BigInt}()
    for (T, a) in m1
        m4[T] = get(m4, T, a)
    end
    for (T, a) in m2
        m4[T] = get(m4, T, a)
    end
    for (T, a) in m3
        m4[T] = get(m4, T, a)
    end
    m5 = Dict{Matrix{Complex{Int}}, BigInt}()
    for (T, a) in m4
        if a != 0
            m5[T] = a
        end
    end
    return m5
end

m = run(4, 2)

for (T, a) in m
    println(T, ": ", a)
end