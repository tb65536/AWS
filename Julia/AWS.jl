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

D1 = Complex{Int}[
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 0 1 0 0
    0 0 0 0 0 0 1 0
    0 0 0 0 0 0 0 1
]

D2 = Complex{Int}[
    3 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 3 0 0 0 0
    0 0 0 0 3 0 0 0
    0 0 0 0 0 3 0 0
    0 0 0 0 0 0 3 0
    0 0 0 0 0 0 0 3
]

D3 = Complex{Int}[
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

function run(n::Int, tracebound::Int, S::Matrix{Complex{Int}}, D::Matrix{Complex{Int}}, L::Matrix{Complex{Int}}, Li::Matrix{Complex{Int}}, d::Int)
    @assert ishermitian(S)
    @assert isposdef(S)
    @assert isdiag(D)
    @assert istriu(L)
    @assert istriu(Li)
    @assert L' * D * L == d * S
    @assert Li * L == d * I
    @assert L * Li == d * I
end

function run(n::Int, tracebound::Int)
    m1 = run(4, 2, S1, D1, L1, Li1, d1)
    m2 = run(4, 2, S2, D2, L2, Li2, d2)
    m3 = run(4, 2, S3, D3, L3, Li3, d3)
    m4 = Dict{Matrix{Complex{Int}},BigInt}()
    for (key, value) in m1
        m4[key] = 0
    end
    for (key, value) in m2
        m4[key] = 0
    end
    for (key, value) in m3
        m4[key] = 0
    end
    for (key, value) in m1
        m4[key] += value
    end
    for (key, value) in m2
        m4[key] += value
    end
    for (key, value) in m3
        m4[key] += value
    end
    m5 = Dict{Matrix{Complex{Int}},BigInt}()
    for (key, value) in m4
        if value != 0
            m5[key] = value
        end
    end
    return m5
end

m = run(4, 2)

for (key, value) in m
    println(key, ": ", value)
end