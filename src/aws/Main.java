package aws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {

    // cache.get(Si).get(k) is a list of all column vectors G with <G,G> = 2k
    private static final Map<Matrix, List<List<Matrix>>> cache = new HashMap<>();

    public static void main(String[] args) {
        System.out.println(Matrix.S1.equals(Matrix.S1.conjugateTranspose()));
        System.out.println(Matrix.S2.equals(Matrix.S2.conjugateTranspose()));
        System.out.println(Matrix.S3.equals(Matrix.S3.conjugateTranspose()));
        computeCache(); // takes about an hour on my laptop
    }

    private static void computeCache() {
        Matrix[] S = {Matrix.S1, Matrix.S2, Matrix.S3};
        Complex[] a = {new Complex(0, 0), new Complex(1, 0), new Complex(-1, 0), new Complex(0, 1), new Complex(0, -1),
            new Complex(1, 1), new Complex(1, -1), new Complex(-1, 1), new Complex(-1, -1),
            new Complex(2, 0), new Complex(-2, 0), new Complex(0, 2), new Complex(0, -2)};
        for (Matrix Si : S) {
            cache.put(Si, new ArrayList<>());
            cache.get(Si).add(new ArrayList<>());
            cache.get(Si).get(0).add(new Matrix(8, 1, new Complex[][]{{a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}}));
            cache.get(Si).add(new ArrayList<>());
        }
        int i = 0;
        for (Complex z1 : a) {
            for (Complex z2 : a) {
                for (Complex z3 : a) {
                    for (Complex z4 : a) {
                        for (Complex z5 : a) {
                            for (Complex z6 : a) {
                                for (Complex z7 : a) {
                                    for (Complex z8 : a) {
                                        Matrix G = new Matrix(8, 1, new Complex[][]{{z1}, {z2}, {z3}, {z4}, {z5}, {z6}, {z7}, {z8}});
                                        Matrix Gt = G.conjugateTranspose();
                                        for (Matrix Si : S) {
                                            if (Gt.multiply(Si).multiply(G).val().val() == 2) {
                                                cache.get(Si).get(1).add(G);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            i++;
            System.out.println("cache progress: " + i + "/" + a.length);
        }
        System.out.println("Built cache: " + cache.get(S[0]).get(1).size() + " " + cache.get(S[1]).get(1).size() + " " + cache.get(S[2]).get(1).size());
//        System.out.println("448 136 176"); // using 5 vectors
//        System.out.println("448 304 448"); // using 9 vectors
//        System.out.println("480 364 480"); // using 13 vectors
//        System.out.println("480 364 480"); // using 15 vectors (including 2+i and 3)
    }
}
