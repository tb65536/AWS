package aws;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {

    private static Map<Matrix, BigInteger> run(int n, long tracebound, Matrix S, Matrix D, Matrix L, Matrix Li, long d) {
        if (S.rows() != 8 || S.columns() != 8) {
            throw new IllegalArgumentException();
        }
        if (L.rows() != 8 || L.columns() != 8) {
            throw new IllegalArgumentException();
        }
        if (D.rows() != 8 || D.columns() != 8) {
            throw new IllegalArgumentException();
        }
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 8; j++) {
                if (i > j && !L.get(i, j).equals(Complex.ZERO)) {
                    throw new IllegalArgumentException();
                }
                if (i > j && !Li.get(i, j).equals(Complex.ZERO)) {
                    throw new IllegalArgumentException();
                }
                if (i != j && !D.get(i, j).equals(Complex.ZERO)) {
                    throw new IllegalArgumentException();
                }
            }
        }
        if (!L.conjugateTranspose().multiply(D).multiply(L).equals(S.multiply(d))) {
            throw new IllegalArgumentException();
        }
        if (!L.multiply(Li).equals(Matrix.I.multiply(d))) {
            throw new IllegalArgumentException();
        }
        if (!Li.multiply(L).equals(Matrix.I.multiply(d))) {
            throw new IllegalArgumentException();
        }
        Matrix Z88 = new Matrix(8, 8);
        Matrix Z8n = new Matrix(8, n);
        Matrix Znn = new Matrix(n, n);
        // Want G* D G = d T and Li G = 0 (mod d)
        Map<Matrix, Map<Matrix, BigInteger>> map = new HashMap<>(); // d T -> Li G -> a
        map.put(Znn, new HashMap<>());
        map.get(Znn).put(Z8n, BigInteger.ONE);
        for (int i = 7; i >= 0; i--) {
            System.out.println("status: " + i + " (" + map.size() + ")");
            long Dv = D.get(i, i).val();
            Map<Matrix, Map<Matrix, BigInteger>> newmap = new HashMap<>();
            for (Matrix dT : map.keySet()) {
                long bound = (d * tracebound - dT.trace().val()) / Dv;
                long sqrt = (long) Math.sqrt(bound);
                List<List<Complex>> possibilities = new ArrayList<>(); // possibilities for each entry of the ith row of G (before imposing congruence)
                for (int j = 0; j < n; j++) {
                    List<Complex> list = new ArrayList<>();
                    for (long x = -sqrt; x <= sqrt; x++) {
                        for (long y = -sqrt; y <= sqrt; y++) {
                            if (x * x + y * y > bound) {
                                continue;
                            }
                            list.add(new Complex(x, y));
                        }
                    }
                    possibilities.add(list);
                }
                for (Matrix LiG : map.get(dT).keySet()) {
                    List<List<Complex>> congruencepossibilities = new ArrayList<>(); // possibilities for each entry of the ith row of G (after imposing congruence)
                    for (int j = 0; j < n; j++) {
                        List<Complex> list = new ArrayList<>();
                        for (Complex z : possibilities.get(j)) {
                            if (!z.multiply(Li.get(i, i)).add(LiG.get(i, j)).mod(d).equals(Complex.ZERO)) {
                                continue;
                            }
                            list.add(z);
                        }
                        congruencepossibilities.add(list);
                    }
                    if (n != 4) {
                        throw new IllegalArgumentException(); // Maybe add support for other n's later
                    }
                    for (Complex z0 : congruencepossibilities.get(0)) {
                        for (Complex z1 : congruencepossibilities.get(1)) {
                            for (Complex z2 : congruencepossibilities.get(2)) {
                                for (Complex z3 : congruencepossibilities.get(3)) {
                                    long v0 = z0.conjugate().multiply(z0).val();
                                    long v1 = z1.conjugate().multiply(z1).val();
                                    long v2 = z2.conjugate().multiply(z2).val();
                                    long v3 = z3.conjugate().multiply(z3).val();
                                    if (v0 + v1 + v2 + v3 > bound) {
                                        continue;
                                    }
                                    Complex[] z = {z0, z1, z2, z3};
                                    Complex[][] aG = new Complex[8][n];
                                    for (int j = 0; j < 8; j++) {
                                        for (int k = 0; k < n; k++) {
                                            aG[j][k] = j == i ? z[k] : Complex.ZERO;
                                        }
                                    }
                                    Matrix nG = new Matrix(8, n, aG);
                                    Matrix G = new Matrix(1, n, new Complex[][]{{z0, z1, z2, z3}});
                                    Matrix ndT = G.conjugateTranspose().multiply(G).multiply(Dv).add(dT);
                                    if (!newmap.containsKey(ndT)) {
                                        newmap.put(ndT, new HashMap<>());
                                    }
                                    Matrix nLiG = Li.multiply(nG).add(LiG).mod(d);
                                    for (int j = 0; j < n; j++) {
                                        if (!nLiG.get(i, j).equals(Complex.ZERO)) {
                                            throw new IllegalArgumentException(); // oops
                                        }
                                    }
                                    newmap.get(ndT).put(nLiG, newmap.get(ndT).getOrDefault(nLiG, BigInteger.ZERO).add(map.get(dT).get(LiG)));
                                }
                            }
                        }
                    }
                }
            }
            map = newmap;
        }
        Map<Matrix, BigInteger> submap = new HashMap<>();
        for (Matrix dT : map.keySet()) {
            if (map.get(dT).containsKey(Z8n)) {
                if (!dT.mod(d).equals(Z88)) {
//                    throw new IllegalArgumentException();
                }
                submap.put(dT.divide(d), map.get(dT).get(Z8n));
            }
        }
        return submap;
    }

    public static void main(String[] args) {
        long tracebound = 2;
        Map<Matrix, BigInteger> M1 = run(4, tracebound, Matrix.S1, Matrix.D1, Matrix.L1, Matrix.Li1, 2);
        Map<Matrix, BigInteger> M2 = run(4, tracebound, Matrix.S2, Matrix.D2, Matrix.L2, Matrix.Li2, 6);
        Map<Matrix, BigInteger> M3 = run(4, tracebound, Matrix.S3, Matrix.D3, Matrix.L3, Matrix.Li3, 2);
        Map<Matrix, BigInteger> M4 = new HashMap<>();
        for (Matrix M : M1.keySet()) {
            System.out.println(M + ": " + M1.get(M));
            M4.put(M, M4.getOrDefault(M, BigInteger.ZERO).add(M1.get(M).multiply(BigInteger.valueOf(8))));
        }
        System.out.println();
        for (Matrix M : M2.keySet()) {
            System.out.println(M + ": " + M2.get(M));
            M4.put(M, M4.getOrDefault(M, BigInteger.ZERO).subtract(M2.get(M).multiply(BigInteger.valueOf(15))));
        }
        System.out.println();
        for (Matrix M : M3.keySet()) {
            System.out.println(M + ": " + M3.get(M));
            M4.put(M, M4.getOrDefault(M, BigInteger.ZERO).add(M3.get(M).multiply(BigInteger.valueOf(7))));
        }
        System.out.println();
        for (Matrix M : M4.keySet()) {
            if (M4.get(M).signum() == 0) {
                continue;
            }
            System.out.println(M + ": " + M4.get(M));
        }
    }
}
